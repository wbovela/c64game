<?php
//
// This file contains the PHP class RLEPack. It reads an assembly data section and 
// attempts to apply Run Length Encoding to shorten the number of bytes. These rules
// apply to the input:
// - Data MUST be in hex format (each value preceded by a '$' sign)
// - There CANNOT be any spaces in the data itself (so $20,$AB,$20,$FF is the only correct way)
// - There may be characters and whitespace before and after the data (like comments or BYTE or WORD or .BYTE or whatever)
// So if your data looks like this it'll work:
// 	BYTE	$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$13,$14,$01,$19,$20,$01,$20,$17,$08,$09,$0C,$05,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66 // comment
//	BYTE	$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66
// Simply type php rlepack.php --file=<inputfilename> > outputfile.asm
//

class RLEPack {

	const ELEMENTS_PER_LINE = 40;
	const BYTE_STRING = '.byte';

	private $m_aOptions;

	public function __construct() {
		date_default_timezone_set('Europe/Amsterdam');
		$this->m_aOptions = null;

	}

	/**
	 * Initilialise the object and validate the input
	 * @throws Exception
	 */
	private function init() {
	
	}

	private function getFileName() {
		if (array_key_exists('file', $this->m_aOptions)) {
			return $this->m_aOptions['file'];		
		} else {
			throw new Exception(__METHOD__.' input file name not found.');
		}
	}

	/**
	 * set the (commandline) options
	 * @param array $p_aOptions
	 * @throws \InvalidArgumentException
	 */
	public function setOptions($p_aOptions) {
		if (array_key_exists('help', $p_aOptions)) {
			throw new ErrorException();
		}
		if (array_key_exists('file', $p_aOptions)) {
			// mandatory parameter file
			if (file_exists($p_aOptions['file'])) {
				$this->m_aOptions['file'] = $p_aOptions['file'];
			} else {
				throw new InvalidArgumentException('Input file not found.');				
			}
		} else {
			throw new InvalidArgumentException('No input filename supplied.');	
		}
	}

	//
	// 
	//
	public function run() {
		$aResult = $this->input($this->getFileName());
		//echo print_r($aResult, true);
		$aRLE = $this->pack($aResult);
		//echo print_r($aRLE, true);
		$this->output($aRLE);
	}

	//
	//
	//
	private function input($p_sFileName) {
		$sFileContents = file_get_contents($p_sFileName);
		// split the contents by whitespaces
		preg_match_all('/\$[\dA-Fa-f,\$]+/', $sFileContents, $aResult);
		return $aResult[0];
	}

	//
	//
	//
	private function output($p_aRLE) {
		$iElements = 0;
		echo "\t".self::BYTE_STRING."\t";
		foreach ($p_aRLE as $aElement) {
			$iQty = $aElement['qty'];
			$iVal = $aElement['val'];
			echo '$'.dechex((float)$iQty).','.$iVal;
			$iElements++;
			if ($iElements === self::ELEMENTS_PER_LINE) {
				$iElements=0;
				echo PHP_EOL."\t".self::BYTE_STRING."\t";
			} else {
				echo ',';
			}			
		}
		// this ends the string
		echo '$00,$00';
	}

	//
	//
	//
	private function unpack($p_aRLE) {
		$iElements = 0;
		echo "\t".self::BYTE_STRING."\t";
		foreach ($p_aRLE as $aElement) {
			$iQty = $aElement['qty'];
			$iVal = $aElement['val'];
			for ($i = 0; $i < $iQty; $i++) {
				echo $iVal.',';
				$iElements++;
				if ($iElements === self::ELEMENTS_PER_LINE) {
					$iElements=0;
					echo PHP_EOL."\t".self::BYTE_STRING."\t";
				}
			}
		}
	}

	//
	//
	//
	private function pack($p_aResult) {
		// now proceed with what's left
		$aScreenData = array();
		if (null !== $p_aResult) {
			// explode each data row into separate array elements
			foreach ($p_aResult as $iKey => $sRow) {
				$aTempRow = explode(',', $sRow);
				$aScreenData[] = $aTempRow;
			}
			// compress
			// declare the array that will contain the end result
			$aRLE = array();
			// go through each row of data
			$sCurrValue = '';
			$iCurrCount = 0;
			foreach ($aScreenData as $aRow) {		
				// go through each value of the row		
				foreach ($aRow as $sValue) {
					// if the value changes...
					if ($sValue !== $sCurrValue) {
						// ..check if it's not the first time around
						if ($sCurrValue !== '') {
							$aElement = array();
							// store the number of occurrences
							$aElement['qty']=$iCurrCount;
							$aElement['val']=$sCurrValue;
							$aRLE[]=$aElement;
						}
						$sCurrValue = $sValue;
						$iCurrCount = 1;
					} else {
						$iCurrCount++;
					}
				}
			}
			// include the last of the bytes
			if ($iCurrCount > 0) {
				$aElement = array();
				$aElement['qty']=$iCurrCount;
				$aElement['val']=$sCurrValue;
				$aRLE[]=$aElement;
			}			
		}
		return $aRLE;		
	}
}

// main startup code
try {
	$oRunner = new RLEPack();
	if (PHP_SAPI == 'cli') {
		$oRunner->setOptions(getopt('', array('file:', 'help::', 'verbose::')));
	} else {
		throw new Exception(basename(__FILE__) . ' add can only be run from the command line.');
	}
	$oRunner->run();
} catch (InvalidArgumentException $e) {
	echo ($e->getMessage() . PHP_EOL);
	echo ("Usage: php " . basename(__FILE__) . " --file=<filename> [--help] [--verbose=<log level>]" . PHP_EOL);
	exit(-2);
} catch (ErrorException $e) {
	echo ("Usage: php " . basename(__FILE__) . " --file=<filename> [--help] [--verbose=<log level>]" . PHP_EOL);
	echo ("Please provide the file to be packed in the --file= option." . PHP_EOL.PHP_EOL);	
	echo ("Help" . PHP_EOL);
} catch (Exception $e) {
	Model_Logger::log('Exception: ' . $e->getMessage(), Model_Logger::LOG_ERROR);
	echo ('Exception: ' . $e->getMessage() . PHP_EOL);
}
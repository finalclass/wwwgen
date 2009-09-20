<?php
class Lib_Exception extends Exception
{
	/**
	 * Typowe bledy, ktore spodziewamy sie wylapac.
	 */
	const HTTP_BAD_REQUEST				= 400;
	const HTTP_UNAUTHORIZED				= 401;
	const HTTP_FORBIDDEN				= 403;
	const HTTP_NOT_FOUND				= 404;
	const HTTP_METHOD_NOT_ALLOWED		= 405;
	const HTTP_REQUEST_TIME_OUT			= 408;
	const HTTP_GONE						= 410;
	const HTTP_LENGTH_REQUIRED			= 411;
	const HTTP_PRECONDITION_FAILED		= 412;
	const HTTP_REQUEST_ENTITY_TOO_LARGE = 413;
	const HTTP_REQUEST_URI_TOO_LARGE	= 414;
	const HTTP_UNSUPPORTED_MEDIA_TYPE	= 415;
	const HTTP_INTERNAL_SERVER_ERROR	= 500;
	const HTTP_NOT_IMPLEMENTED			= 501;
	const HTTP_BAD_GATEWAY				= 502;
	const HTTP_SERVICE_UNAVAILABLE		= 503;
	const HTTP_VARIANT_ALSO_VARIES		= 506;

	/**
	 * Komunikaty dla messanger.
	 */
	const MESSAGE_NEUTRAL = 10;
	const MESSAGE_NEGATIVE = 11;
	const MESSAGE_POSITIVE = 12;

	public function __contruct( $message, $code ) {
		parent::__construct( $mesage, $code );
	}
}
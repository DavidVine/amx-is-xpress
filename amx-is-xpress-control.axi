program_name='amx-is-xpress-control'

#if_not_defined __AMX_IS_XPRESS_CONTROL__
#define __AMX_IS_XPRESS_CONTROL__

#include 'amx-is-xpress-api'


/*
 * --------------------
 * Function: xpressUpdateVariable
 *
 * Parameters:  dev xpressPlayerIpSocketDevice - ip socket to connect to Xpress player
 *              char xpressPlayerIpAddress[] - ip address of Xpress player
 *              integer networkApiTcpPort - network API TCP port Xpress player is configured for
 *              char varName[] - variable to update
 *              char value[] - value to set the variable to
 * 
 * Description: Update a variable on an Xpress player.
 *              NOTE: this function does no IP error checking and just assumes that the IP connection
 *              attempt was successful.
 * --------------------
 */
define_function xpressUpdateVariable (dev xpressPlayerIpSocketDevice, char xpressPlayerIpAddress[], integer networkApiTcpPort, char varName[], char value[])
{
	stack_var char strToSend[100]
	
	ip_client_open (xpressPlayerIpSocketDevice.port, xpressPlayerIpAddress, networkApiTcpPort, IP_TCP)
	
	strToSend = "XPRESS_COMMAND_UPDATE,' "',varName,'" "',value,'"',$0D,$0A"
	
	send_string xpressPlayerIpSocketDevice, strToSend
	
	ip_client_close (xpressPlayerIpSocketDevice.port)
}











#end_if
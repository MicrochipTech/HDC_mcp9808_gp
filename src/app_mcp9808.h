/*******************************************************************************
  MPLAB Harmony Application Header File

  Company:
    Microchip Technology Inc.

  File Name:
    app_mcp9808.h

  Summary:
    This header file provides prototypes and definitions for the application.

  Description:
    This header file provides function prototypes and data type definitions for
    the application.  Some of these are required by the system (such as the
    "APP_MCP9808_Initialize" and "APP_MCP9808_Tasks" prototypes) and some of them are only used
    internally by the application (such as the "APP_MCP9808_STATES" definition).  Both
    are defined here for convenience.
*******************************************************************************/

#ifndef _APP_MCP9808_H
#define _APP_MCP9808_H

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include "configuration.h"
#include "driver/driver_common.h"

// DOM-IGNORE-BEGIN
#ifdef __cplusplus  // Provide C++ Compatibility

extern "C" {

#endif
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Type Definitions
// *****************************************************************************
// *****************************************************************************
typedef struct
{
    DRV_HANDLE drvHandle;
    volatile bool isTempReadDone;
    volatile bool isREGWriteDone;
    volatile bool isREGReadDone;
    volatile bool tempSensorError;
    uint16_t rawTemperatureData;
    uint8_t temperature; 
    uint8_t wrBuffer[2];
    uint8_t rdBuffer[2];
    uint16_t dataWord;
}MCP9808_DATA;
// *****************************************************************************
/* Application states

  Summary:
    Application states enumeration

  Description:
    This enumeration defines the valid application states.  These states
    determine the behavior of the application at various times.
*/

typedef enum
{
    /* Application's state machine's initial state. */
    APP_MCP9808_STATE_INIT=0,
    APP_MCP9808_STATE_SERVICE_TASKS,
            APP_MCP9808_STATE_READ_RAW_DATA,
            APP_MCP9808_STATE_CONVERT_TEMP,
            APP_MCP9808_STATE_READ_ID,
            APP_MCP9808_STATE_REG_WRITE,
            APP_MCP9808_STATE_REG_WRITE_WAIT,
    APP_MCP9808_STATE_IDLE
    /* TODO: Define states used by the application state machine. */

} APP_MCP9808_STATES;


// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    Application strings and buffers are be defined outside this structure.
 */

typedef struct
{
    /* The application's current state */
    APP_MCP9808_STATES state;

    /* TODO: Define any additional data used by the application. */

} APP_MCP9808_DATA;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Routines
// *****************************************************************************
// *****************************************************************************
/* These routines are called by drivers when certain events occur.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_MCP9808_Initialize ( void )

  Summary:
     MPLAB Harmony application initialization routine.

  Description:
    This function initializes the Harmony application.  It places the
    application in its initial state and prepares it to run so that its
    APP_MCP9808_Tasks function can be called.

  Precondition:
    All other system initialization routines should be called before calling
    this routine (in "SYS_Initialize").

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_MCP9808_Initialize();
    </code>

  Remarks:
    This routine must be called from the SYS_Initialize function.
*/

void APP_MCP9808_Initialize ( void );


/*******************************************************************************
  Function:
    void APP_MCP9808_Tasks ( void )

  Summary:
    MPLAB Harmony Demo application tasks function

  Description:
    This routine is the Harmony Demo application's tasks function.  It
    defines the application's state machine and core logic.

  Precondition:
    The system and application initialization ("SYS_Initialize") should be
    called before calling this.

  Parameters:
    None.

  Returns:
    None.

  Example:
    <code>
    APP_MCP9808_Tasks();
    </code>

  Remarks:
    This routine must be called from SYS_Tasks() routine.
 */

void APP_MCP9808_Tasks( void );

//DOM-IGNORE-BEGIN
#ifdef __cplusplus
}
#endif
//DOM-IGNORE-END

#endif /* _APP_MCP9808_H */

/*******************************************************************************
 End of File
 */


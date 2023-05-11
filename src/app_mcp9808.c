/*******************************************************************************
  MPLAB Harmony Application Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_mcp9808.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It
    implements the logic of the application's state machine and it may call
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "app_mcp9808.h"
#include "definitions.h"
#include "app_mcp9808.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

static MCP9808_DATA appI0C1tempSensorData;

static void APP_MCP9808_Callback(DRV_MCP9808_EVENT event, uintptr_t context)
{
    MCP9808_DATA* pTempSensorData = (MCP9808_DATA*)context;
    
    switch(event)
    {
        case DRV_MCP9808_EVENT_TEMP_READ_DONE:
            pTempSensorData->isTempReadDone = true;
            break;
        case DRV_MCP9808_EVENT_REGISTER_WRITE_DONE:
            pTempSensorData->isREGWriteDone = true;
            break;
        case DRV_MCP9808_EVENT_EEPROM_READ_DONE:            
            pTempSensorData->isREGReadDone = true;
            break;
        case DRV_MCP9808_EVENT_ERROR:
            pTempSensorData->tempSensorError = true;
            break;
    }
}
// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_MCP9808_Initialize function.

    Application strings and buffers are be defined outside this structure.
*/

APP_MCP9808_DATA app_mcp9808Data;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************
void CMD_Read_Temperature (void)
{
    app_mcp9808Data.state = APP_MCP9808_STATE_READ_RAW_DATA;
}

void CMD_Read_ID (void)
{
    app_mcp9808Data.state = APP_MCP9808_STATE_READ_ID;
}

void CMD_Write_Reg (void)
{
    app_mcp9808Data.state = APP_MCP9808_STATE_REG_WRITE;
}

const SYS_CMD_DESCRIPTOR appCmdTbl[]=
{
    {"read_temp", (SYS_CMD_FNC)CMD_Read_Temperature, ": Reads Temperature from MCP9808"},
    {"read_ID", (SYS_CMD_FNC)CMD_Read_ID, ": Reads ID MCP9808"},
    {"conf_alert", (SYS_CMD_FNC)CMD_Write_Reg, ": Write Configuration"},
};

/* TODO:  Add any necessary local functions.
*/




// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_MCP9808_Initialize ( void )

  Remarks:
    See prototype in app_mcp9808.h.
 */

void APP_MCP9808_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    
    SYS_CMD_PRINT("\e[1;1H\e[2J");
    
    if (!SYS_CMD_ADDGRP(appCmdTbl, sizeof(appCmdTbl)/sizeof(*appCmdTbl), "read_temp", ": user commands"))
    {
        SYS_ERROR(SYS_ERROR_ERROR, "Failed to create Application Commands\r\n");
    }
    
    if (!SYS_CMD_ADDGRP(appCmdTbl, sizeof(appCmdTbl)/sizeof(*appCmdTbl), "read_ID", ": user commands"))
    {
        SYS_ERROR(SYS_ERROR_ERROR, "Failed to create Application Commands\r\n");
    }
    
    if (!SYS_CMD_ADDGRP(appCmdTbl, sizeof(appCmdTbl)/sizeof(*appCmdTbl), "conf_alert", ": user commands"))
    {
        SYS_ERROR(SYS_ERROR_ERROR, "Failed to create Application Commands\r\n");
    }
    
    app_mcp9808Data.state = APP_MCP9808_STATE_INIT;
}


/******************************************************************************
  Function:
    void APP_MCP9808_Tasks ( void )

  Remarks:
    See prototype in app_mcp9808.h.
 */

void APP_MCP9808_Tasks ( void )
{
    volatile MCP9808_DATA* pTempSensorData = &appI0C1tempSensorData;
    /* Check the application's current state. */
    switch ( app_mcp9808Data.state )
    {
        /* Application's initial state. */
        case APP_MCP9808_STATE_INIT:
        {
            pTempSensorData->drvHandle = DRV_MCP9808_Open(DRV_MCP9808_INDEX_0, 0);

            DRV_MCP9808_TransferEventHandlerSet(pTempSensorData->drvHandle, APP_MCP9808_Callback, (uintptr_t)pTempSensorData);

            DRV_MCP9808_CONFIG_PARAMS configParams;
            configParams.tempSensorAddr = 0x18;
            configParams.transferParams.clockSpeed = 400000;

            DRV_MCP9808_TransferSetup(pTempSensorData->drvHandle, &configParams);
            
            bool appInitialized = true;


            if (appInitialized)
            {
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            break;
        }

        case APP_MCP9808_STATE_READ_RAW_DATA:
        {
            pTempSensorData->isTempReadDone = false;        
            pTempSensorData->tempSensorError = false;
            if (DRV_MCP9808_TemperatureRead(pTempSensorData->drvHandle, (uint16_t*)&pTempSensorData->rawTemperatureData) == true)
            {
                app_mcp9808Data.state = APP_MCP9808_STATE_CONVERT_TEMP;
            }
            else
            {
                SYS_CMD_MESSAGE("Temperature read error!\r\n");
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            break;
        }
        
        case APP_MCP9808_STATE_CONVERT_TEMP:     
        {      
            if (pTempSensorData->tempSensorError == true)
            {
                printf("Temperature read error!\r\n");
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            else if (pTempSensorData->isTempReadDone == true)
            {
                pTempSensorData->temperature = DRV_MCP9808_TemperatureGet(pTempSensorData->drvHandle, (uint16_t*)&pTempSensorData->rawTemperatureData);
                SYS_CMD_PRINT("Temperature = %dC\r\n", pTempSensorData->temperature);
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            break;
        }
        
        case APP_MCP9808_STATE_READ_ID:
        {
            pTempSensorData->isTempReadDone = false;        
            pTempSensorData->tempSensorError = false;
            if (DRV_MCP9808_ReadWord(pTempSensorData->drvHandle, 0x06, (uint16_t*)&pTempSensorData->dataWord) == true)
            {
                uint16_t transposed = ((pTempSensorData->dataWord & 0xFF00) >> 8) | ((pTempSensorData->dataWord & 0x00FF) << 8);
                SYS_CMD_PRINT("Manufacture ID = %04x\r\n", transposed);
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            else
            {
                SYS_CMD_MESSAGE("Temperature read error!\r\n");
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            break;
        }
        
        case APP_MCP9808_STATE_REG_WRITE:
            pTempSensorData->isREGWriteDone = false;
            pTempSensorData->tempSensorError = false;
            pTempSensorData->wrBuffer[0] = 0x08;
            pTempSensorData->wrBuffer[1] = 0x00;
            if (DRV_MCP9808_Write(pTempSensorData->drvHandle, 0x01, (uint8_t*)pTempSensorData->wrBuffer, 2) == true)
            {
                app_mcp9808Data.state = APP_MCP9808_STATE_REG_WRITE_WAIT;
            }
            else
            {
                SYS_CMD_MESSAGE("Register write error!\r\n");
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            break;
        
        case APP_MCP9808_STATE_REG_WRITE_WAIT:
            if (pTempSensorData->isREGWriteDone == true)
            {
                SYS_CMD_MESSAGE("Alert Config is written to the Register\r\n");
                app_mcp9808Data.state = APP_MCP9808_STATE_IDLE;
            }
            break;
            
        case APP_MCP9808_STATE_IDLE:
        {
            break;
        }

        default:
        {
            break;
        }
    }
}


/*******************************************************************************
 End of File
 */

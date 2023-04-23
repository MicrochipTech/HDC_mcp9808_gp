/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _DRV_BME280_H    /* Guard against multiple inclusion */
#define _DRV_BME280_H

#include "drv_bme280_definitions.h"
#include "drv_bme280_local.h"

#include <xc.h>
#include <stdint.h>
//#include "../click_interface.h"

/**
  Section: Macro Declarations
 */

// Device Information
#define BME280_ADDR     0x76
#define BME280_CHIP_ID  0x60

// Sensor Modes
#define BME280_SLEEP_MODE           0x00
#define BME280_FORCED_MODE          0x01
#define BME280_NORMAL_MODE          0x03
#define BME280_SOFT_RESET           0xB6

// Oversampling Options
#define BME280_OVERSAMP_SKIPPED     0x00
#define BME280_OVERSAMP_X1          0x01
#define BME280_OVERSAMP_X2          0x02
#define BME280_OVERSAMP_X4          0x03
#define BME280_OVERSAMP_X8          0x04
#define BME280_OVERSAMP_X16         0x05

// Standby Time
#define BME280_STANDBY_HALFMS   0x00
#define BME280_STANDBY_63MS     0x01
#define BME280_STANDBY_125MS    0x02
#define BME280_STANDBY_250MS    0x03
#define BME280_STANDBY_500MS    0x04
#define BME280_STANDBY_1000MS   0x05
#define BME280_STANDBY_10MS     0x06
#define BME280_STANDBY_20MS     0x07

// Filter Coefficients
#define BME280_FILTER_COEFF_OFF     0x00
#define BME280_FILTER_COEFF_2       0x01
#define BME280_FILTER_COEFF_4       0x02
#define BME280_FILTER_COEFF_8       0x03
#define BME280_FILTER_COEFF_16      0x04


//Public API interface, function declarations
SYS_MODULE_OBJ DRV_BME280_Initialize( const SYS_MODULE_INDEX drvIndex, const SYS_MODULE_INIT* const init);

DRV_HANDLE DRV_BME280_Open(const SYS_MODULE_INDEX drvIndex, const DRV_IO_INTENT ioIntent);

void DRV_BME280_Close(const DRV_HANDLE handle);

void DRV_BME280_TransferEventHandlerSet( const DRV_HANDLE handle, const DRV_BME280_APP_CALLBACK callback, const uintptr_t context);

uint8_t DRV_BME280_TemperatureGet(const DRV_HANDLE handle, uint16_t* temperatureData);

bool DRV_BME280_TemperatureRead(const DRV_HANDLE handle, uint16_t* temperatureData);

bool DRV_BME280_EEPROMWrite(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* wrBuffer, uint8_t nWrBytes);

bool DRV_BME280_EEPROMRead(const DRV_HANDLE handle, uint8_t memAddr, uint8_t* rdBuffer, uint8_t nRdBytes);

bool DRV_BME280_TransferSetup(const DRV_HANDLE handle, DRV_BME280_CONFIG_PARAMS* configParams);

/**
  Section: BME280 Sensor Driver APIs
 */

uint8_t BME280_getID(const DRV_HANDLE handle);
void BME280_reset(const DRV_HANDLE handle);
void BME280_reset(const DRV_HANDLE handle);
void BME280_readFactoryCalibrationParams(const DRV_HANDLE handle);
void BME280_setStandbyTime(uint8_t Value);
void BME280_setFilterCoefficient(uint8_t Value);
void BME280_setOversamplingTemperature(uint8_t Value);
void BME280_setOversamplingPressure(uint8_t Value);
void BME280_setOversamplingHumidity(uint8_t Value);
void BME280_setSensorMode(uint8_t Value);
void BME280_initializeSensor(const DRV_HANDLE handle);
void BME280_startForcedSensing(const DRV_HANDLE handle);
uint8_t BME280_isMeasuring(const DRV_HANDLE handle);
void BME280_readMeasurements(const DRV_HANDLE handle);
float BME280_getTemperature(void);
float BME280_getHumidity(void);
float BME280_getPressure(void);
void BME280_sleep(const DRV_HANDLE handle);

#endif /* _EXAMPLE_FILE_NAME_H */

/* *****************************************************************************
 End of File
 */

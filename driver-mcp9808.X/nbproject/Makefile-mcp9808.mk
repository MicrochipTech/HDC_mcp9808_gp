#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-mcp9808.mk)" "nbproject/Makefile-local-mcp9808.mk"
include nbproject/Makefile-local-mcp9808.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=mcp9808
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/config/mcp9808/startup_xc32.c ../src/main.c ../src/config/mcp9808/peripheral/evsys/plib_evsys.c ../src/config/mcp9808/osal/osal_freertos.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/config/mcp9808/initialization.c ../src/config/mcp9808/peripheral/cmcc/plib_cmcc.c ../src/config/mcp9808/peripheral/clock/plib_clock.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/config/mcp9808/system/reset/sys_reset.c ../src/config/mcp9808/driver/i2c/src/drv_i2c.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/config/mcp9808/interrupts.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/config/mcp9808/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c ../src/config/mcp9808/freertos_hooks.c ../src/config/mcp9808/libc_syscalls.c ../src/config/mcp9808/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/mcp9808/peripheral/nvic/plib_nvic.c ../src/config/mcp9808/system/int/src/sys_int.c ../src/config/mcp9808/tasks.c ../src/config/mcp9808/exceptions.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/config/mcp9808/peripheral/sercom/usart/plib_sercom1_usart.c ../src/config/mcp9808/system/cache/sys_cache.c ../src/app_mcp9808.c ../src/config/mcp9808/stdio/xc32_monitor.c ../src/config/mcp9808/system/command/src/sys_command.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/config/mcp9808/bsp/bsp.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/config/mcp9808/system/console/src/sys_console.c ../src/config/mcp9808/peripheral/port/plib_port.c ../src/config/mcp9808/system/console/src/sys_console_uart.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/config/mcp9808/driver/i2c_mcp9808/drv_mcp9808.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/519814254/startup_xc32.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1883794006/plib_evsys.o ${OBJECTDIR}/_ext/1820763632/osal_freertos.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/519814254/initialization.o ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o ${OBJECTDIR}/_ext/1885943492/plib_clock.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/1581363856/sys_reset.o ${OBJECTDIR}/_ext/136144951/drv_i2c.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/519814254/interrupts.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o ${OBJECTDIR}/_ext/519814254/freertos_hooks.o ${OBJECTDIR}/_ext/519814254/libc_syscalls.o ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o ${OBJECTDIR}/_ext/1324973556/plib_nvic.o ${OBJECTDIR}/_ext/1587138469/sys_int.o ${OBJECTDIR}/_ext/519814254/tasks.o ${OBJECTDIR}/_ext/519814254/exceptions.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o ${OBJECTDIR}/_ext/1595351133/sys_cache.o ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o ${OBJECTDIR}/_ext/605370968/xc32_monitor.o ${OBJECTDIR}/_ext/1427623807/sys_command.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1998409442/bsp.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/1884335987/sys_console.o ${OBJECTDIR}/_ext/1325026707/plib_port.o ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/519814254/startup_xc32.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1883794006/plib_evsys.o.d ${OBJECTDIR}/_ext/1820763632/osal_freertos.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/519814254/initialization.o.d ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o.d ${OBJECTDIR}/_ext/1885943492/plib_clock.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/1665200909/heap_1.o.d ${OBJECTDIR}/_ext/1581363856/sys_reset.o.d ${OBJECTDIR}/_ext/136144951/drv_i2c.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/519814254/interrupts.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o.d ${OBJECTDIR}/_ext/519814254/freertos_hooks.o.d ${OBJECTDIR}/_ext/519814254/libc_syscalls.o.d ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o.d ${OBJECTDIR}/_ext/1324973556/plib_nvic.o.d ${OBJECTDIR}/_ext/1587138469/sys_int.o.d ${OBJECTDIR}/_ext/519814254/tasks.o.d ${OBJECTDIR}/_ext/519814254/exceptions.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o.d ${OBJECTDIR}/_ext/1595351133/sys_cache.o.d ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o.d ${OBJECTDIR}/_ext/605370968/xc32_monitor.o.d ${OBJECTDIR}/_ext/1427623807/sys_command.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/1998409442/bsp.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/1884335987/sys_console.o.d ${OBJECTDIR}/_ext/1325026707/plib_port.o.d ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/519814254/startup_xc32.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1883794006/plib_evsys.o ${OBJECTDIR}/_ext/1820763632/osal_freertos.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/519814254/initialization.o ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o ${OBJECTDIR}/_ext/1885943492/plib_clock.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/1665200909/heap_1.o ${OBJECTDIR}/_ext/1581363856/sys_reset.o ${OBJECTDIR}/_ext/136144951/drv_i2c.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/519814254/interrupts.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o ${OBJECTDIR}/_ext/519814254/freertos_hooks.o ${OBJECTDIR}/_ext/519814254/libc_syscalls.o ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o ${OBJECTDIR}/_ext/1324973556/plib_nvic.o ${OBJECTDIR}/_ext/1587138469/sys_int.o ${OBJECTDIR}/_ext/519814254/tasks.o ${OBJECTDIR}/_ext/519814254/exceptions.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o ${OBJECTDIR}/_ext/1595351133/sys_cache.o ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o ${OBJECTDIR}/_ext/605370968/xc32_monitor.o ${OBJECTDIR}/_ext/1427623807/sys_command.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1998409442/bsp.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/1884335987/sys_console.o ${OBJECTDIR}/_ext/1325026707/plib_port.o ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o

# Source Files
SOURCEFILES=../src/config/mcp9808/startup_xc32.c ../src/main.c ../src/config/mcp9808/peripheral/evsys/plib_evsys.c ../src/config/mcp9808/osal/osal_freertos.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/config/mcp9808/initialization.c ../src/config/mcp9808/peripheral/cmcc/plib_cmcc.c ../src/config/mcp9808/peripheral/clock/plib_clock.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c ../src/config/mcp9808/system/reset/sys_reset.c ../src/config/mcp9808/driver/i2c/src/drv_i2c.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/config/mcp9808/interrupts.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/config/mcp9808/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c ../src/config/mcp9808/freertos_hooks.c ../src/config/mcp9808/libc_syscalls.c ../src/config/mcp9808/peripheral/nvmctrl/plib_nvmctrl.c ../src/config/mcp9808/peripheral/nvic/plib_nvic.c ../src/config/mcp9808/system/int/src/sys_int.c ../src/config/mcp9808/tasks.c ../src/config/mcp9808/exceptions.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/config/mcp9808/peripheral/sercom/usart/plib_sercom1_usart.c ../src/config/mcp9808/system/cache/sys_cache.c ../src/app_mcp9808.c ../src/config/mcp9808/stdio/xc32_monitor.c ../src/config/mcp9808/system/command/src/sys_command.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/config/mcp9808/bsp/bsp.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/config/mcp9808/system/console/src/sys_console.c ../src/config/mcp9808/peripheral/port/plib_port.c ../src/config/mcp9808/system/console/src/sys_console_uart.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/config/mcp9808/driver/i2c_mcp9808/drv_mcp9808.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-mcp9808.mk ${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=ATSAME54P20A
MP_LINKER_FILE_OPTION=,--script="..\src\config\mcp9808\ATSAME54P20A.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/519814254/startup_xc32.o: ../src/config/mcp9808/startup_xc32.c  .generated_files/flags/mcp9808/a636164eb1b365bd1a0fcdb1616ec945bdf8f078 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/519814254/startup_xc32.o ../src/config/mcp9808/startup_xc32.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/mcp9808/4e6fab622a7e0edd53a3c773029dee38b9b76496 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1883794006/plib_evsys.o: ../src/config/mcp9808/peripheral/evsys/plib_evsys.c  .generated_files/flags/mcp9808/d4a2003e1e2bf3245dea20dcd06f903b87feaedd .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1883794006" 
	@${RM} ${OBJECTDIR}/_ext/1883794006/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1883794006/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1883794006/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1883794006/plib_evsys.o ../src/config/mcp9808/peripheral/evsys/plib_evsys.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1820763632/osal_freertos.o: ../src/config/mcp9808/osal/osal_freertos.c  .generated_files/flags/mcp9808/6769bfb9eb8623bf6ab5e90c58e25440e3b70856 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1820763632" 
	@${RM} ${OBJECTDIR}/_ext/1820763632/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1820763632/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1820763632/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1820763632/osal_freertos.o ../src/config/mcp9808/osal/osal_freertos.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/mcp9808/b19d440ba95e9c6397124ee15df3cf4eb1cd1954 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/initialization.o: ../src/config/mcp9808/initialization.c  .generated_files/flags/mcp9808/e5bb134a1dd9cce06ffbedf3ceb402a74297e712 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/initialization.o.d" -o ${OBJECTDIR}/_ext/519814254/initialization.o ../src/config/mcp9808/initialization.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1324637020/plib_cmcc.o: ../src/config/mcp9808/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/mcp9808/a7646dce938a5465927542b5904a421af95cd851 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1324637020" 
	@${RM} ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1324637020/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o ../src/config/mcp9808/peripheral/cmcc/plib_cmcc.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1885943492/plib_clock.o: ../src/config/mcp9808/peripheral/clock/plib_clock.c  .generated_files/flags/mcp9808/df55c33b991906411b1de8553249f6bd16000d21 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1885943492" 
	@${RM} ${OBJECTDIR}/_ext/1885943492/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1885943492/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1885943492/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1885943492/plib_clock.o ../src/config/mcp9808/peripheral/clock/plib_clock.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/mcp9808/3dc3a65fd08568805b8297aef75721b776627ab0 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/mcp9808/ee245d81996974a9ac46d7cff1f5d628e410f6c .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1581363856/sys_reset.o: ../src/config/mcp9808/system/reset/sys_reset.c  .generated_files/flags/mcp9808/ede673631ffa1425657ca835a76ef50a3bf07fde .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1581363856" 
	@${RM} ${OBJECTDIR}/_ext/1581363856/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1581363856/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1581363856/sys_reset.o.d" -o ${OBJECTDIR}/_ext/1581363856/sys_reset.o ../src/config/mcp9808/system/reset/sys_reset.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/136144951/drv_i2c.o: ../src/config/mcp9808/driver/i2c/src/drv_i2c.c  .generated_files/flags/mcp9808/cd20eabdf2f74f49756f8924e31531e507ed5505 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/136144951" 
	@${RM} ${OBJECTDIR}/_ext/136144951/drv_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/136144951/drv_i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/136144951/drv_i2c.o.d" -o ${OBJECTDIR}/_ext/136144951/drv_i2c.o ../src/config/mcp9808/driver/i2c/src/drv_i2c.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/mcp9808/82181070c52db88fb64d08fb825a75934af365fd .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/interrupts.o: ../src/config/mcp9808/interrupts.c  .generated_files/flags/mcp9808/1121b2fbdeab7451b221dbef930e372d135f3c29 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/interrupts.o.d" -o ${OBJECTDIR}/_ext/519814254/interrupts.o ../src/config/mcp9808/interrupts.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/mcp9808/e3ab0af21892950634430da60f82b07d46ae8819 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o: ../src/config/mcp9808/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c  .generated_files/flags/mcp9808/c7aeffe027339a8ea8b053e897d4af2619f30b32 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1646999677" 
	@${RM} ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o.d" -o ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o ../src/config/mcp9808/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/freertos_hooks.o: ../src/config/mcp9808/freertos_hooks.c  .generated_files/flags/mcp9808/c022f2e7873d4cb45421ed5234d17479d42c72d6 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/519814254/freertos_hooks.o ../src/config/mcp9808/freertos_hooks.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/libc_syscalls.o: ../src/config/mcp9808/libc_syscalls.c  .generated_files/flags/mcp9808/60e519ba20bb00ffce609bdaf4769ce7d798d602 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/519814254/libc_syscalls.o ../src/config/mcp9808/libc_syscalls.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o: ../src/config/mcp9808/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/mcp9808/d2aafea166162d447cf18518a6895b90c2737f94 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1541565758" 
	@${RM} ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o ../src/config/mcp9808/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1324973556/plib_nvic.o: ../src/config/mcp9808/peripheral/nvic/plib_nvic.c  .generated_files/flags/mcp9808/1a66de8bcdec47adee0d05409909d802e3e3f1c9 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1324973556" 
	@${RM} ${OBJECTDIR}/_ext/1324973556/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324973556/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1324973556/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1324973556/plib_nvic.o ../src/config/mcp9808/peripheral/nvic/plib_nvic.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1587138469/sys_int.o: ../src/config/mcp9808/system/int/src/sys_int.c  .generated_files/flags/mcp9808/21e17060f35d67fdfe7db677d88a27c2a4c6ed93 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1587138469" 
	@${RM} ${OBJECTDIR}/_ext/1587138469/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/1587138469/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1587138469/sys_int.o.d" -o ${OBJECTDIR}/_ext/1587138469/sys_int.o ../src/config/mcp9808/system/int/src/sys_int.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/tasks.o: ../src/config/mcp9808/tasks.c  .generated_files/flags/mcp9808/fc1173b7eb4cd390c2965a410e4611735adad759 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/tasks.o.d" -o ${OBJECTDIR}/_ext/519814254/tasks.o ../src/config/mcp9808/tasks.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/exceptions.o: ../src/config/mcp9808/exceptions.c  .generated_files/flags/mcp9808/14ee68f7bde86ffbee4517911950b654a0ce3c3e .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/exceptions.o.d" -o ${OBJECTDIR}/_ext/519814254/exceptions.o ../src/config/mcp9808/exceptions.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/mcp9808/689331b1a6a40e55038985625f846086b9098fa7 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o: ../src/config/mcp9808/peripheral/sercom/usart/plib_sercom1_usart.c  .generated_files/flags/mcp9808/fdf7bea091ba24de08f026670725abe2f3f9cf51 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1027107927" 
	@${RM} ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o.d" -o ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o ../src/config/mcp9808/peripheral/sercom/usart/plib_sercom1_usart.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1595351133/sys_cache.o: ../src/config/mcp9808/system/cache/sys_cache.c  .generated_files/flags/mcp9808/104208a1d8db1de8e77660206d392b5ea82686ef .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1595351133" 
	@${RM} ${OBJECTDIR}/_ext/1595351133/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1595351133/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1595351133/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1595351133/sys_cache.o ../src/config/mcp9808/system/cache/sys_cache.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_mcp9808.o: ../src/app_mcp9808.c  .generated_files/flags/mcp9808/ac7770421623d4bc657f54714e1249ae4c2066a9 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_mcp9808.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o ../src/app_mcp9808.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/605370968/xc32_monitor.o: ../src/config/mcp9808/stdio/xc32_monitor.c  .generated_files/flags/mcp9808/ee128b9b9f122b8d8ae6365c0b67336a72ae2e19 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/605370968" 
	@${RM} ${OBJECTDIR}/_ext/605370968/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/605370968/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/605370968/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/605370968/xc32_monitor.o ../src/config/mcp9808/stdio/xc32_monitor.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1427623807/sys_command.o: ../src/config/mcp9808/system/command/src/sys_command.c  .generated_files/flags/mcp9808/199cbd2e5c2d5cadfb7b47e73efec57391d33c61 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1427623807" 
	@${RM} ${OBJECTDIR}/_ext/1427623807/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1427623807/sys_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1427623807/sys_command.o.d" -o ${OBJECTDIR}/_ext/1427623807/sys_command.o ../src/config/mcp9808/system/command/src/sys_command.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/mcp9808/1f4a11d344b953040bb68a06bb7cf71c27b8faf3 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1998409442/bsp.o: ../src/config/mcp9808/bsp/bsp.c  .generated_files/flags/mcp9808/4240d9c1c1d01830d74a433aa6bf402170777e6d .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1998409442" 
	@${RM} ${OBJECTDIR}/_ext/1998409442/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1998409442/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1998409442/bsp.o.d" -o ${OBJECTDIR}/_ext/1998409442/bsp.o ../src/config/mcp9808/bsp/bsp.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/mcp9808/65951a18c7f9a928ffdd100347340663ef7baf66 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1884335987/sys_console.o: ../src/config/mcp9808/system/console/src/sys_console.c  .generated_files/flags/mcp9808/fa90e6cf52acb8300c3c8b6f1fa42277b19afbbd .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1884335987" 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1884335987/sys_console.o.d" -o ${OBJECTDIR}/_ext/1884335987/sys_console.o ../src/config/mcp9808/system/console/src/sys_console.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1325026707/plib_port.o: ../src/config/mcp9808/peripheral/port/plib_port.c  .generated_files/flags/mcp9808/1651ad5b22ff2bea9a14af6ee096daf9bd7f4aef .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1325026707" 
	@${RM} ${OBJECTDIR}/_ext/1325026707/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1325026707/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1325026707/plib_port.o.d" -o ${OBJECTDIR}/_ext/1325026707/plib_port.o ../src/config/mcp9808/peripheral/port/plib_port.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1884335987/sys_console_uart.o: ../src/config/mcp9808/system/console/src/sys_console_uart.c  .generated_files/flags/mcp9808/df426a2c2afc7da468cfbe3e3ea1bdfb6a12c928 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1884335987" 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1884335987/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o ../src/config/mcp9808/system/console/src/sys_console_uart.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/mcp9808/5f267d170ce89c0434a2f14d2ddcf2d23eb94128 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o: ../src/config/mcp9808/driver/i2c_mcp9808/drv_mcp9808.c  .generated_files/flags/mcp9808/3fb05fb7ae71b76228b8c83296d44e32afe95fc8 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1243884746" 
	@${RM} ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o.d 
	@${RM} ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o.d" -o ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o ../src/config/mcp9808/driver/i2c_mcp9808/drv_mcp9808.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/519814254/startup_xc32.o: ../src/config/mcp9808/startup_xc32.c  .generated_files/flags/mcp9808/8139e0082a327d985ab0f94817d23eb1c09d26a0 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/519814254/startup_xc32.o ../src/config/mcp9808/startup_xc32.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/mcp9808/c9856e46067984a545897730ad1b58f356e47c13 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1883794006/plib_evsys.o: ../src/config/mcp9808/peripheral/evsys/plib_evsys.c  .generated_files/flags/mcp9808/a7855b60e25c7fad4b617be661cc9ef815b7b119 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1883794006" 
	@${RM} ${OBJECTDIR}/_ext/1883794006/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1883794006/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1883794006/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1883794006/plib_evsys.o ../src/config/mcp9808/peripheral/evsys/plib_evsys.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1820763632/osal_freertos.o: ../src/config/mcp9808/osal/osal_freertos.c  .generated_files/flags/mcp9808/8243d44c0df536b2814dae007a76136ce49541e .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1820763632" 
	@${RM} ${OBJECTDIR}/_ext/1820763632/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1820763632/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1820763632/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1820763632/osal_freertos.o ../src/config/mcp9808/osal/osal_freertos.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/mcp9808/93cebbf03e437ccd8b9856a0697c3a8d40f3296e .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/initialization.o: ../src/config/mcp9808/initialization.c  .generated_files/flags/mcp9808/c0f41b4157344c11206b6731dbf4242925fd0965 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/initialization.o.d" -o ${OBJECTDIR}/_ext/519814254/initialization.o ../src/config/mcp9808/initialization.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1324637020/plib_cmcc.o: ../src/config/mcp9808/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/mcp9808/b6230169117cb12a6c77afd85eb04d374867b601 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1324637020" 
	@${RM} ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1324637020/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1324637020/plib_cmcc.o ../src/config/mcp9808/peripheral/cmcc/plib_cmcc.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1885943492/plib_clock.o: ../src/config/mcp9808/peripheral/clock/plib_clock.c  .generated_files/flags/mcp9808/ba64dbae1075dd9c17bf499006696ca0aad0f295 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1885943492" 
	@${RM} ${OBJECTDIR}/_ext/1885943492/plib_clock.o.d 
	@${RM} ${OBJECTDIR}/_ext/1885943492/plib_clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1885943492/plib_clock.o.d" -o ${OBJECTDIR}/_ext/1885943492/plib_clock.o ../src/config/mcp9808/peripheral/clock/plib_clock.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/mcp9808/635cbc70e3174b6c0f7c1e4198907fe69adc0c9 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_1.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c  .generated_files/flags/mcp9808/276f1e033beb92131e231bc785530bebcd5b3b46 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_1.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_1.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_1.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1581363856/sys_reset.o: ../src/config/mcp9808/system/reset/sys_reset.c  .generated_files/flags/mcp9808/9472733daca2c7bd536f47ccf5da914170979372 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1581363856" 
	@${RM} ${OBJECTDIR}/_ext/1581363856/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/1581363856/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1581363856/sys_reset.o.d" -o ${OBJECTDIR}/_ext/1581363856/sys_reset.o ../src/config/mcp9808/system/reset/sys_reset.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/136144951/drv_i2c.o: ../src/config/mcp9808/driver/i2c/src/drv_i2c.c  .generated_files/flags/mcp9808/a2611aafc6e08ed03da7aec5659e0d88485e8572 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/136144951" 
	@${RM} ${OBJECTDIR}/_ext/136144951/drv_i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/136144951/drv_i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/136144951/drv_i2c.o.d" -o ${OBJECTDIR}/_ext/136144951/drv_i2c.o ../src/config/mcp9808/driver/i2c/src/drv_i2c.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/mcp9808/5055af618c58fe7afc886aa073e4e1da211188e .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/interrupts.o: ../src/config/mcp9808/interrupts.c  .generated_files/flags/mcp9808/6740b80914e38afd4561227f7ebaa9082da2e873 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/interrupts.o.d" -o ${OBJECTDIR}/_ext/519814254/interrupts.o ../src/config/mcp9808/interrupts.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/mcp9808/8c8ac369099519d09f4c474c89f05ee3bb1658f7 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o: ../src/config/mcp9808/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c  .generated_files/flags/mcp9808/26dadc5e2a2ba773f7e794c9580dd132e04c47ef .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1646999677" 
	@${RM} ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o.d 
	@${RM} ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o.d" -o ${OBJECTDIR}/_ext/1646999677/plib_sercom6_i2c_master.o ../src/config/mcp9808/peripheral/sercom/i2c_master/plib_sercom6_i2c_master.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/freertos_hooks.o: ../src/config/mcp9808/freertos_hooks.c  .generated_files/flags/mcp9808/3183d8c15343d87fd5e3bde7a95128f902bd883e .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/519814254/freertos_hooks.o ../src/config/mcp9808/freertos_hooks.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/libc_syscalls.o: ../src/config/mcp9808/libc_syscalls.c  .generated_files/flags/mcp9808/b97e4866aa87ad25a6c639bb090990c604858c3c .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/519814254/libc_syscalls.o ../src/config/mcp9808/libc_syscalls.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o: ../src/config/mcp9808/peripheral/nvmctrl/plib_nvmctrl.c  .generated_files/flags/mcp9808/8df51cdefbf1806c36af8e4567316c6b7e0d5632 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1541565758" 
	@${RM} ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o.d" -o ${OBJECTDIR}/_ext/1541565758/plib_nvmctrl.o ../src/config/mcp9808/peripheral/nvmctrl/plib_nvmctrl.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1324973556/plib_nvic.o: ../src/config/mcp9808/peripheral/nvic/plib_nvic.c  .generated_files/flags/mcp9808/734b44a4221afa53d537c48a0559c5d5ceffb7c6 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1324973556" 
	@${RM} ${OBJECTDIR}/_ext/1324973556/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324973556/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1324973556/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1324973556/plib_nvic.o ../src/config/mcp9808/peripheral/nvic/plib_nvic.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1587138469/sys_int.o: ../src/config/mcp9808/system/int/src/sys_int.c  .generated_files/flags/mcp9808/c36fb166dd16570e6091a48bd0ccd3c6e3e779a6 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1587138469" 
	@${RM} ${OBJECTDIR}/_ext/1587138469/sys_int.o.d 
	@${RM} ${OBJECTDIR}/_ext/1587138469/sys_int.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1587138469/sys_int.o.d" -o ${OBJECTDIR}/_ext/1587138469/sys_int.o ../src/config/mcp9808/system/int/src/sys_int.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/tasks.o: ../src/config/mcp9808/tasks.c  .generated_files/flags/mcp9808/e78212506c5be3a8a76617c417a2c323b0ff5177 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/tasks.o.d" -o ${OBJECTDIR}/_ext/519814254/tasks.o ../src/config/mcp9808/tasks.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/519814254/exceptions.o: ../src/config/mcp9808/exceptions.c  .generated_files/flags/mcp9808/9d13d372674d2b87c87c5b2f5115d6fbb2d15f2c .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/519814254" 
	@${RM} ${OBJECTDIR}/_ext/519814254/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/519814254/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/519814254/exceptions.o.d" -o ${OBJECTDIR}/_ext/519814254/exceptions.o ../src/config/mcp9808/exceptions.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/mcp9808/6e3a6ae4e94a66cc22c59175d15bd4f2862184a3 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o: ../src/config/mcp9808/peripheral/sercom/usart/plib_sercom1_usart.c  .generated_files/flags/mcp9808/da1e49803bdd99b099c925e1c6c24f2db46db8a4 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1027107927" 
	@${RM} ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o.d" -o ${OBJECTDIR}/_ext/1027107927/plib_sercom1_usart.o ../src/config/mcp9808/peripheral/sercom/usart/plib_sercom1_usart.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1595351133/sys_cache.o: ../src/config/mcp9808/system/cache/sys_cache.c  .generated_files/flags/mcp9808/766f79b190ddb21184eacd051643b13f44f29936 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1595351133" 
	@${RM} ${OBJECTDIR}/_ext/1595351133/sys_cache.o.d 
	@${RM} ${OBJECTDIR}/_ext/1595351133/sys_cache.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1595351133/sys_cache.o.d" -o ${OBJECTDIR}/_ext/1595351133/sys_cache.o ../src/config/mcp9808/system/cache/sys_cache.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_mcp9808.o: ../src/app_mcp9808.c  .generated_files/flags/mcp9808/1eb420bcfcaf466ee38b0b0d18c1314242cab158 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_mcp9808.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_mcp9808.o ../src/app_mcp9808.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/605370968/xc32_monitor.o: ../src/config/mcp9808/stdio/xc32_monitor.c  .generated_files/flags/mcp9808/e6060d44ec77aeaef307b6b339fea774b99d9ffc .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/605370968" 
	@${RM} ${OBJECTDIR}/_ext/605370968/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/605370968/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/605370968/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/605370968/xc32_monitor.o ../src/config/mcp9808/stdio/xc32_monitor.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1427623807/sys_command.o: ../src/config/mcp9808/system/command/src/sys_command.c  .generated_files/flags/mcp9808/531fac4baf60f8416dfa3b0a1277cf065aa0de96 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1427623807" 
	@${RM} ${OBJECTDIR}/_ext/1427623807/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/1427623807/sys_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1427623807/sys_command.o.d" -o ${OBJECTDIR}/_ext/1427623807/sys_command.o ../src/config/mcp9808/system/command/src/sys_command.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/mcp9808/d907ce079f21fcb9c795ddeeba4f7279fa5883b1 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1998409442/bsp.o: ../src/config/mcp9808/bsp/bsp.c  .generated_files/flags/mcp9808/a11922aaaa4fcd7cdefe61d793b1d9016d4e12cd .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1998409442" 
	@${RM} ${OBJECTDIR}/_ext/1998409442/bsp.o.d 
	@${RM} ${OBJECTDIR}/_ext/1998409442/bsp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1998409442/bsp.o.d" -o ${OBJECTDIR}/_ext/1998409442/bsp.o ../src/config/mcp9808/bsp/bsp.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/mcp9808/4797ee9fe6a06eb0adb49892b4919ea0664ecf2a .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1884335987/sys_console.o: ../src/config/mcp9808/system/console/src/sys_console.c  .generated_files/flags/mcp9808/30c7d3cddc8768ef86ba2b64d32668b488d6d255 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1884335987" 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1884335987/sys_console.o.d" -o ${OBJECTDIR}/_ext/1884335987/sys_console.o ../src/config/mcp9808/system/console/src/sys_console.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1325026707/plib_port.o: ../src/config/mcp9808/peripheral/port/plib_port.c  .generated_files/flags/mcp9808/7cb4a965711ef1d15a4e6d0e0d01c4c4d226c3a4 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1325026707" 
	@${RM} ${OBJECTDIR}/_ext/1325026707/plib_port.o.d 
	@${RM} ${OBJECTDIR}/_ext/1325026707/plib_port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1325026707/plib_port.o.d" -o ${OBJECTDIR}/_ext/1325026707/plib_port.o ../src/config/mcp9808/peripheral/port/plib_port.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1884335987/sys_console_uart.o: ../src/config/mcp9808/system/console/src/sys_console_uart.c  .generated_files/flags/mcp9808/21d4b56ec8d6a5827cc28b8e0266bd7355bcee99 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1884335987" 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1884335987/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1884335987/sys_console_uart.o ../src/config/mcp9808/system/console/src/sys_console_uart.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/mcp9808/58f6822c478c19513c501f097332e36fcb4e6a33 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o: ../src/config/mcp9808/driver/i2c_mcp9808/drv_mcp9808.c  .generated_files/flags/mcp9808/ab8473f0209062ed946353fcbdaff5a352a4b882 .generated_files/flags/mcp9808/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1243884746" 
	@${RM} ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o.d 
	@${RM} ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fno-common -I"../src" -I"../src/config/mcp9808" -I"../src/packs/ATSAME54P20A_DFP" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Werror -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o.d" -o ${OBJECTDIR}/_ext/1243884746/drv_mcp9808.o ../src/config/mcp9808/driver/i2c_mcp9808/drv_mcp9808.c    -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/config/mcp9808/ATSAME54P20A.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1024,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/config/mcp9808/ATSAME54P20A.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mno-device-startup-code -o ${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_mcp9808=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/driver-mcp9808.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

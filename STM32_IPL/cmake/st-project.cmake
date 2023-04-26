function(add_st_target_properties TARGET_NAME)

target_compile_definitions(
    ${TARGET_NAME} PRIVATE
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:USE_HAL_DRIVER>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:CORE_CM7>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:STM32H747xx>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:USE_STM32H747I_DISCO>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:USE_USB_HS>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:DATA_IN_ExtSDRAM>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:STM32IPL>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:__FPU_PRESENT>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:ARM_MATH_CM7>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:STM32>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:STM32H7DUAL>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:STM32H747XIHx>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:STM32H7>"
)

target_include_directories(
    ${TARGET_NAME} PRIVATE
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Core/Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Common/Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/CMSIS/Include>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/CMSIS/DSP/Include>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32H7xx/Include>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc/Legacy>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/BSP/STM32H747I-Discovery>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/BSP/Components/Common>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/BSP/Components/ov5640>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Drivers/BSP/Components/ov9655>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Middlewares/STM32_USB_Device_Library/Core/Inc>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Utilities/JPEG>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:${PROJECT_SOURCE_DIR}/Middlewares/STM32_ImageProcessing_Library/Inc>"
)

target_compile_options(
    ${TARGET_NAME} PRIVATE
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:ASM>>:-g3>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-g3>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:-g3>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:ASM>>:-g0>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:-g0>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:CXX>>:-g0>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:-O3>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:-Os>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:CXX>>:-Os>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:C>>:>"
    "$<$<AND:$<CONFIG:Debug>,$<COMPILE_LANGUAGE:CXX>>:>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:C>>:>"
    "$<$<AND:$<NOT:$<CONFIG:Debug>>,$<COMPILE_LANGUAGE:CXX>>:>"
    "$<$<CONFIG:Debug>:-mcpu=cortex-m7>"
    "$<$<CONFIG:Debug>:-mfpu=fpv5-d16>"
    "$<$<CONFIG:Debug>:-mfloat-abi=hard>"
    "$<$<NOT:$<CONFIG:Debug>>:-mcpu=cortex-m7>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfpu=fpv5-d16>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfloat-abi=hard>"
)

target_link_libraries(
    ${TARGET_NAME} PRIVATE
)

target_link_directories(
    ${TARGET_NAME} PRIVATE
)

target_link_options(
    ${TARGET_NAME} PRIVATE
    "$<$<CONFIG:Debug>:-mcpu=cortex-m7>"
    "$<$<CONFIG:Debug>:-mfpu=fpv5-d16>"
    "$<$<CONFIG:Debug>:-mfloat-abi=hard>"
    "$<$<NOT:$<CONFIG:Debug>>:-mcpu=cortex-m7>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfpu=fpv5-d16>"
    "$<$<NOT:$<CONFIG:Debug>>:-mfloat-abi=hard>"
    -T
    "$<$<CONFIG:Debug>:${PROJECT_SOURCE_DIR}/STM32H747XIHX_FLASH_CM7.ld>"
    "$<$<NOT:$<CONFIG:Debug>>:${PROJECT_SOURCE_DIR}/STM32H747XIHX_FLASH_CM7.ld>"
)

target_sources(
    ${TARGET_NAME} PRIVATE
    "Core/Src/main.c"
    "Core/Src/stm32h7xx_hal_msp.c"
    "Core/Src/stm32h7xx_it.c"
    "Core/Src/usbd_conf.c"
    "Core/Src/usbd_desc.c"
    "Core/Src/usbd_video.c"
    "Core/Src/usbd_video_if.c"
    "Common/Src/system_stm32h7xx.c"
    "Utilities/JPEG/jpeg_utils.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cortex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dcmi.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma2d.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma_ex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_exti.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_flash.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_flash_ex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_gpio.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2c.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2c_ex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_jpeg.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_mdma.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pcd.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pcd_ex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr_ex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc_ex.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_sdram.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_ll_fmc.c"
    "Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_ll_usb.c"
    "Middlewares/STM32_USB_Device_Library/Core/Src/usbd_core.c"
    "Middlewares/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c"
    "Middlewares/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c"
    "Drivers/BSP/Components/is42s32800j/is42s32800j.c"
    "Drivers/BSP/Components/ov5640/ov5640.c"
    "Drivers/BSP/Components/ov5640/ov5640_reg.c"
    "Drivers/BSP/Components/ov9655/ov9655.c"
    "Drivers/BSP/Components/ov9655/ov9655_reg.c"
    "Drivers/BSP/STM32H747I-Discovery/stm32h747i_discovery.c"
    "Drivers/BSP/STM32H747I-Discovery/stm32h747i_discovery_bus.c"
    "Drivers/BSP/STM32H747I-Discovery/stm32h747i_discovery_camera.c"
    "Core/Src/stm32h747i_discovery_camera_ex.c"
    "Drivers/BSP/STM32H747I-Discovery/stm32h747i_discovery_sdram.c"
    "startup_stm32h747xx.s"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\apriltag.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\array.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\binary.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\blob.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\clahe.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\collections.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\draw.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\edge.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\filter.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\fmath.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\haar.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\hough.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\imlib.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\integral_mw.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\integral.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\jdata_conf.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\lab_tab.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\line.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\matd.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\mathop.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\point.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\pool.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\rectangle.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\sincos_tab.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stats.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_binary.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_blob.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_convert.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_drawing.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_edge.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_equalization.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_filtering.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_find_pixels.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_geometry.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_hough.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_image_io_jpg_sw.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_image_io.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_integral.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_masking.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_math_op.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_mem_alloc.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_morph_op.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_object_det.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_point.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_rect.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_resize.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_rotation.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_stats.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_template.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl_warping.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\stm32ipl.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\template.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\umm_malloc.c"
    "Middlewares\\STM32_ImageProcessing_Library\\Src\\xyz_tab.c"
)

add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${TARGET_NAME}>
)

add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex
    $<TARGET_FILE:${TARGET_NAME}> ${TARGET_NAME}.hex
)

add_custom_command(
    TARGET ${TARGET_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary
    $<TARGET_FILE:${TARGET_NAME}> ${TARGET_NAME}.bin
)

endfunction()
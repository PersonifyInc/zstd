MACRO(ADD_EXTRA_COMPILATION_FLAGS)
    include(CheckCXXCompilerFlag)
    include(CheckCCompilerFlag)
    if (CMAKE_COMPILER_IS_GNUCXX OR MINGW) #Not only UNIX but also WIN32 for MinGW

        set(POSITION_INDEPENDENT_CODE_FLAG "-fPIC")
        CHECK_C_COMPILER_FLAG(${POSITION_INDEPENDENT_CODE_FLAG} POSITION_INDEPENDENT_CODE_FLAG_ALLOWED)
        if (POSITION_INDEPENDENT_CODE_FLAG_ALLOWED)
            MESSAGE("Compiler flag ${POSITION_INDEPENDENT_CODE_FLAG} allowed")
            set(ACTIVATE_POSITION_INDEPENDENT_CODE_FLAG "ON" CACHE BOOL "activate -fPIC flag")
        else ()
            MESSAGE("Compiler flag ${POSITION_INDEPENDENT_CODE_FLAG} not allowed")
        endif (POSITION_INDEPENDENT_CODE_FLAG_ALLOWED)

        set(WARNING_UNDEF "-Wundef")
        CHECK_C_COMPILER_FLAG(${WARNING_UNDEF} WARNING_UNDEF_ALLOWED)
        if (WARNING_UNDEF_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_UNDEF} allowed")
            set(ACTIVATE_WARNING_UNDEF "ON" CACHE BOOL "activate -Wundef flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_UNDEF} not allowed")
        endif (WARNING_UNDEF_ALLOWED)

        set(WARNING_SHADOW "-Wshadow")
        CHECK_C_COMPILER_FLAG(${WARNING_SHADOW} WARNING_SHADOW_ALLOWED)
        if (WARNING_SHADOW_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_SHADOW} allowed")
            set(ACTIVATE_WARNING_SHADOW "ON" CACHE BOOL "activate -Wshadow flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_SHADOW} not allowed")
        endif (WARNING_SHADOW_ALLOWED)

        set(WARNING_CAST_ALIGN "-Wcast-align")
        CHECK_C_COMPILER_FLAG(${WARNING_CAST_ALIGN} WARNING_CAST_ALIGN_ALLOWED)
        if (WARNING_CAST_ALIGN_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_CAST_ALIGN} allowed")
            set(ACTIVATE_WARNING_CAST_ALIGN "ON" CACHE BOOL "activate -Wcast-align flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_CAST_ALIGN} not allowed")
        endif (WARNING_CAST_ALIGN_ALLOWED)

        set(WARNING_CAST_QUAL "-Wcast-qual")
        CHECK_C_COMPILER_FLAG(${WARNING_CAST_QUAL} WARNING_CAST_QUAL_ALLOWED)
        if (WARNING_CAST_QUAL_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_CAST_QUAL} allowed")
            set(ACTIVATE_WARNING_CAST_QUAL "ON" CACHE BOOL "activate -Wcast-qual flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_CAST_QUAL} not allowed")
        endif (WARNING_CAST_QUAL_ALLOWED)

        set(WARNING_STRICT_PROTOTYPES "-Wstrict-prototypes")
        CHECK_C_COMPILER_FLAG(${WARNING_STRICT_PROTOTYPES} WARNING_STRICT_PROTOTYPES_ALLOWED)
        if (WARNING_STRICT_PROTOTYPES_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_STRICT_PROTOTYPES} allowed")
            set(ACTIVATE_WARNING_STRICT_PROTOTYPES "ON" CACHE BOOL "activate -Wstrict-prototypes flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_STRICT_PROTOTYPES} not allowed")
        endif (WARNING_STRICT_PROTOTYPES_ALLOWED)

        set(WARNING_ALL "-Wall")
        CHECK_C_COMPILER_FLAG(${WARNING_ALL} WARNING_ALL_ALLOWED)
        if (WARNING_ALL_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_ALL} allowed")
            set(ACTIVATE_WARNING_ALL "ON" CACHE BOOL "activate -Wall flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_ALL} not allowed")
        endif (WARNING_ALL_ALLOWED)

        set(WARNING_EXTRA "-Wextra")
        CHECK_C_COMPILER_FLAG(${WARNING_EXTRA} WARNING_EXTRA_ALLOWED)
        if (WARNING_EXTRA_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_EXTRA} allowed")
            set(ACTIVATE_WARNING_EXTRA "ON" CACHE BOOL "activate -Wextra flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_EXTRA} not allowed")
        endif (WARNING_EXTRA_ALLOWED)

        set(WARNING_FLOAT_EQUAL "-Wfloat-equal")
        CHECK_C_COMPILER_FLAG(${WARNING_FLOAT_EQUAL} WARNING_FLOAT_EQUAL_ALLOWED)
        if (WARNING_FLOAT_EQUAL_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_FLOAT_EQUAL} allowed")
            set(ACTIVATE_WARNING_FLOAT_EQUAL "OFF" CACHE BOOL "activate -Wfloat-equal flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_FLOAT_EQUAL} not allowed")
        endif (WARNING_FLOAT_EQUAL_ALLOWED)

        set(WARNING_SIGN_CONVERSION "-Wsign-conversion")
        CHECK_C_COMPILER_FLAG(${WARNING_SIGN_CONVERSION} WARNING_SIGN_CONVERSION_ALLOWED)
        if (WARNING_SIGN_CONVERSION_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_SIGN_CONVERSION} allowed")
            set(ACTIVATE_WARNING_SIGN_CONVERSION "OFF" CACHE BOOL "activate -Wsign-conversion flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_SIGN_CONVERSION} not allowed")
        endif (WARNING_SIGN_CONVERSION_ALLOWED)

        if (ACTIVATE_POSITION_INDEPENDENT_CODE_FLAG)
            list(APPEND ZSTD_C_FLAGS_COMMON ${POSITION_INDEPENDENT_CODE_FLAG})
        endif (ACTIVATE_POSITION_INDEPENDENT_CODE_FLAG)

        if (ACTIVATE_WARNING_UNDEF)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_UNDEF})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_UNDEF})
        endif (ACTIVATE_WARNING_UNDEF)

        if (ACTIVATE_WARNING_SHADOW)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_SHADOW})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_SHADOW})
        endif (ACTIVATE_WARNING_SHADOW)

        if (ACTIVATE_WARNING_CAST_QUAL)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_CAST_QUAL})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_CAST_QUAL})
        endif (ACTIVATE_WARNING_CAST_QUAL)

        if (ACTIVATE_WARNING_CAST_ALIGN)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_CAST_ALIGN})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_CAST_ALIGN})
        endif (ACTIVATE_WARNING_CAST_ALIGN)

        if (ACTIVATE_WARNING_STRICT_PROTOTYPES)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_STRICT_PROTOTYPES})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_STRICT_PROTOTYPES})
        endif (ACTIVATE_WARNING_STRICT_PROTOTYPES)

        if (ACTIVATE_WARNING_ALL)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_ALL})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_ALL})
        endif (ACTIVATE_WARNING_ALL)

        if (ACTIVATE_WARNING_EXTRA)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_EXTRA})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_EXTRA})
        endif (ACTIVATE_WARNING_EXTRA)

        if (ACTIVATE_WARNING_FLOAT_EQUAL)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_FLOAT_EQUAL})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_FLOAT_EQUAL})
        endif (ACTIVATE_WARNING_FLOAT_EQUAL)

        if (ACTIVATE_WARNING_SIGN_CONVERSION)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_SIGN_CONVERSION})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_SIGN_CONVERSION})
        endif (ACTIVATE_WARNING_SIGN_CONVERSION)


    elseif (MSVC)
        # Add specific compilation flags for Windows Visual

        set(WARNING_ALL "/Wall")
        CHECK_C_COMPILER_FLAG(${WARNING_ALL} WARNING_ALL_ALLOWED)
        if (WARNING_ALL_ALLOWED)
            MESSAGE("Compiler flag ${WARNING_ALL} allowed")
            set(ACTIVATE_WARNING_ALL "OFF" CACHE BOOL "activate /Wall flag")
        else ()
            MESSAGE("Compiler flag ${WARNING_ALL} not allowed")
        endif (WARNING_ALL_ALLOWED)
        	
        set(RTC_FLAG "/RTC1")
        CHECK_C_COMPILER_FLAG(${RTC_FLAG} RTC_FLAG_ALLOWED)
        if (RTC_FLAG_ALLOWED)
            MESSAGE("Compiler flag ${RTC_FLAG} allowed")
            set(ACTIVATE_RTC_FLAG "ON" CACHE BOOL "activate /RTC1 flag")
        else ()
            MESSAGE("Compiler flag ${RTC_FLAG} not allowed")
        endif (RTC_FLAG_ALLOWED)
        	
        set(ZC_FLAG "/Zc:forScope")
        CHECK_C_COMPILER_FLAG(${ZC_FLAG} ZC_FLAG_ALLOWED)
        if (ZC_FLAG_ALLOWED)
            MESSAGE("Compiler flag ${ZC_FLAG} allowed")
            set(ACTIVATE_ZC_FLAG "ON" CACHE BOOL "activate /Zc:forScope flag")
        else ()
            MESSAGE("Compiler flag ${ZC_FLAG} not allowed")
        endif (ZC_FLAG_ALLOWED)
        	
        set(GD_FLAG "/Gd")
        CHECK_C_COMPILER_FLAG(${GD_FLAG} GD_FLAG_ALLOWED)
        if (GD_FLAG_ALLOWED)
            MESSAGE("Compiler flag ${GD_FLAG} allowed")
            set(ACTIVATE_GD_FLAG "ON" CACHE BOOL "activate /Gd flag")
        else ()
            MESSAGE("Compiler flag ${GD_FLAG} not allowed")
        endif (GD_FLAG_ALLOWED)
        	
        set(ANALYZE_FLAG "/analyze:stacksize25000")
        CHECK_C_COMPILER_FLAG(${ANALYZE_FLAG} ANALYZE_FLAG_ALLOWED)
        if (ANALYZE_FLAG_ALLOWED)
            MESSAGE("Compiler flag ${ANALYZE_FLAG} allowed")
            set(ACTIVATE_ANALYZE_FLAG "ON" CACHE BOOL "activate /ANALYZE flag")
        else ()
            MESSAGE("Compiler flag ${ANALYZE_FLAG} not allowed")
        endif (ANALYZE_FLAG_ALLOWED)

        if (ACTIVATE_WARNING_ALL)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${WARNING_ALL})
            list(APPEND ZSTD_C_FLAGS_COMMON ${WARNING_ALL})
        endif (ACTIVATE_WARNING_ALL)
        	
        # Only for DEBUG version
        if (ACTIVATE_RTC_FLAG)
            list(APPEND ZSTD_CXX_FLAGS_DEBUG ${RTC_FLAG})
            list(APPEND ZSTD_C_FLAGS_DEBUG ${RTC_FLAG})
        endif (ACTIVATE_RTC_FLAG)
        	
        if (ACTIVATE_ZC_FLAG)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${ZC_FLAG})
            list(APPEND ZSTD_C_FLAGS_COMMON ${ZC_FLAG})
        endif (ACTIVATE_ZC_FLAG)
        	
        if (ACTIVATE_GD_FLAG)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${GD_FLAG})
            list(APPEND ZSTD_C_FLAGS_COMMON ${GD_FLAG})
        endif (ACTIVATE_GD_FLAG)
        	
        if (ACTIVATE_ANALYZE_FLAG)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${ANALYZE_FLAG})
            list(APPEND ZSTD_C_FLAGS_COMMON ${ANALYZE_FLAG})
        endif (ACTIVATE_ANALYZE_FLAG)
        	
        if (MSVC80 OR MSVC90 OR MSVC10 OR MSVC11)
            # To avoid compiler warning (level 4) C4571, compile with /EHa if you still want
            # your catch(...) blocks to catch structured exceptions.
	    list(APPEND ZSTD_CXX_FLAGS_COMMON "/EHa")
        endif (MSVC80 OR MSVC90 OR MSVC10 OR MSVC11)

        set(MULTITHREADED_COMPILATION "/MP")
        MESSAGE("Compiler flag ${MULTITHREADED_COMPILATION} allowed")
        set(ACTIVATE_MULTITHREADED_COMPILATION "ON" CACHE BOOL "activate /MP flag")

        if (ACTIVATE_MULTITHREADED_COMPILATION)
            list(APPEND ZSTD_CXX_FLAGS_COMMON ${MULTITHREADED_COMPILATION})
            list(APPEND ZSTD_C_FLAGS_COMMON ${MULTITHREADED_COMPILATION})
        endif (ACTIVATE_MULTITHREADED_COMPILATION)

        #For exceptions
        list(APPEND ZSTD_CXX_FLAGS_COMMON "/EHsc")
        list(APPEND ZSTD_C_FLAGS_COMMON "/EHsc")
        
        # UNICODE SUPPORT
	#list(APPEND ZSTD_CXX_FLAGS_COMMON "/D_UNICODE /DUNICODE")
	#list(APPEND ZSTD_C_FLAGS_COMMON "/D_UNICODE /DUNICODE")
    endif ()

    set(ZSTD_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} ${ZSTD_CXX_FLAGS_COMMON} ${ZSTD_CXX_FLAGS_DEBUG}")
    set(ZSTD_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${ZSTD_CXX_FLAGS_COMMON}")
    set(ZSTD_CXX_FLAGS_MINSIZEREL "${CMAKE_CXX_FLAGS_MINSIZEREL} ${ZSTD_CXX_FLAGS_COMMON}")
    set(ZSTD_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO} ${ZSTD_CXX_FLAGS_COMMON}")

    set(ZSTD_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} ${ZSTD_C_FLAGS_COMMON} ${ZSTD_C_FLAGS_DEBUG}")
    set(ZSTD_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${ZSTD_C_FLAGS_COMMON}")
    set(ZSTD_C_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL} ${ZSTD_C_FLAGS_COMMON}")
    set(ZSTD_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} ${ZSTD_C_FLAGS_COMMON}")

    # Remove duplicates compilation flags
	FOREACH (flag_var ZSTD_C_FLAGS_DEBUG ZSTD_C_FLAGS_RELEASE
                          ZSTD_C_FLAGS_MINSIZEREL ZSTD_C_FLAGS_RELWITHDEBINFO
		          ZSTD_CXX_FLAGS_DEBUG ZSTD_CXX_FLAGS_RELEASE
		          ZSTD_CXX_FLAGS_MINSIZEREL ZSTD_CXX_FLAGS_RELWITHDEBINFO)
	    separate_arguments(${flag_var})
	    list(REMOVE_DUPLICATES ${flag_var})
    ENDFOREACH (flag_var)  

    if (MSVC)
        # Replace /MT to /MD flag
    	# Replace /O2 to /O3 flag
        FOREACH (flag_var ZSTD_C_FLAGS_DEBUG ZSTD_C_FLAGS_RELEASE
                          ZSTD_C_FLAGS_MINSIZEREL ZSTD_C_FLAGS_RELWITHDEBINFO
		          ZSTD_CXX_FLAGS_DEBUG ZSTD_CXX_FLAGS_RELEASE
		          ZSTD_CXX_FLAGS_MINSIZEREL ZSTD_CXX_FLAGS_RELWITHDEBINFO)
            STRING(REGEX REPLACE "/MT" "/MD" ${flag_var} "${${flag_var}}")
            STRING(REGEX REPLACE "/O2" "/Ox" ${flag_var} "${${flag_var}}")
        ENDFOREACH (flag_var)      
    endif ()

    set(ZSTD_CXX_FLAGS_DEBUG "${ZSTD_CXX_FLAGS_DEBUG}" CACHE STRING "Updated flags" FORCE)
    set(ZSTD_CXX_FLAGS_RELEASE "${ZSTD_CXX_FLAGS_RELEASE}" CACHE STRING "Updated flags" FORCE)
    set(ZSTD_CXX_FLAGS_MINSIZEREL "${ZSTD_CXX_FLAGS_MINSIZEREL}" CACHE STRING "Updated flags" FORCE)
    set(ZSTD_CXX_FLAGS_RELWITHDEBINFO "${ZSTD_CXX_FLAGS_RELWITHDEBINFO}" CACHE STRING "Updated flags" FORCE)

    set(ZSTD_C_FLAGS_DEBUG "${ZSTD_C_FLAGS_DEBUG}" CACHE STRING "Updated flags" FORCE)
    set(ZSTD_C_FLAGS_RELEASE "${ZSTD_C_FLAGS_RELEASE}" CACHE STRING "Updated flags" FORCE)
    set(ZSTD_C_FLAGS_MINSIZEREL "${ZSTD_C_FLAGS_MINSIZEREL}" CACHE STRING "Updated flags" FORCE)
    set(ZSTD_C_FLAGS_RELWITHDEBINFO "${ZSTD_C_FLAGS_RELWITHDEBINFO}" CACHE STRING "Updated flags" FORCE)

ENDMACRO(ADD_EXTRA_COMPILATION_FLAGS)

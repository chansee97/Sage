#pragma once

#ifdef SAGE_PLATFORM_WINDOWS
	#ifdef SAGE_BUILD_DLL
		#define SAGE_API __declspec(dllexport)
	#else
		#define SAGE_API __declspec(dllimport)
	#endif

#else
	#error Sage only supports Windows!
#endif

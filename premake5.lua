workspace "Sage"
    architecture "x64"
    configurations 
    { 
      "Debug", 
      "Release",
      "Dist"
     }
    platforms 
    { 
      "x64" 
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Sage"
    location "Sage"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/"..outputdir.. "/%{prj.name}")

    files 
    { 
      "%{prj.name}/src/**.h", 
      "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
      "%{prj.name}/src",
      "%{prj.name}/vendor/spdlog/include",
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        buildoptions 
        { 
          "/utf-8"
        }

        defines
        {
          "SAGE_PLATFORM_WINDOWS",
          "SAGE_BUILD_DLL"
        }

        postbuildcommands
        {
          ("{COPYDIR} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir ..  "/Sandbox/\"" )
        }
    
    filter "configurations:Debug"
        defines "SAGE_DEBUG"
        symbols "On"
      
    filter "configurations:Release"
        defines "SAGE_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "SAGE_DIST"
        optimize "On"


project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" ..outputdir.. "/%{prj.name}")
    objdir ("bin-int/"..outputdir.. "/%{prj.name}")

    
    files 
    { 
      "%{prj.name}/src/**.h", 
      "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
      "Sage/vendor/spdlog/include",
      "Sage/src",
    }

    links
    {
      "Sage"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"
        buildoptions 
        { 
          "/utf-8"
        }

        defines
        {
          "SAGE_PLATFORM_WINDOWS",
        }
    
    filter "configurations:Debug"
        defines "SAGE_DEBUG"
        symbols "On"
      
    filter "configurations:Release"
        defines "SAGE_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "SAGE_DIST"
        optimize "On"

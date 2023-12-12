workspace "LeetcodeProject"
   configurations { "Debug", "Release" }

   -- Set Clang as the default compiler
   toolset "clang"

project "LeetcodeApp"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"

   files { "**.h", "**.c" }

   -- Use environment variable for vcpkg paths
   local vcpkgPath = os.getenv("VCPKG_ROOT")
   includedirs { vcpkgPath .. "/installed/x64-linux/include" }
   libdirs { vcpkgPath .. "/installed/x64-linux/share" }

   postbuildcommands {
      "echo Post-build step",
      "./run_sanitizers.sh"
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

   -- Specify compiler options for Clang on Windows
   filter { "system:windows" }
      buildoptions { "-std=c11" }
      -- If you need to specify the Clang path, you can do it like this:
      -- toolset("clang")
      -- premake.gcc.cc = "path/to/clang"

   -- Compiler options for non-Windows systems
   filter { "system:not windows" }
      buildoptions { "-std=c11" }

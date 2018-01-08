{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_ciddi_oyler (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/yunus/ciddi-oyler/.stack-work/install/x86_64-osx/lts-10.3/8.2.2/bin"
libdir     = "/Users/yunus/ciddi-oyler/.stack-work/install/x86_64-osx/lts-10.3/8.2.2/lib/x86_64-osx-ghc-8.2.2/ciddi-oyler-0.1.0.0-9D3djR9wPqlAg6ZLMsMsUl-ciddi-oyler"
dynlibdir  = "/Users/yunus/ciddi-oyler/.stack-work/install/x86_64-osx/lts-10.3/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/yunus/ciddi-oyler/.stack-work/install/x86_64-osx/lts-10.3/8.2.2/share/x86_64-osx-ghc-8.2.2/ciddi-oyler-0.1.0.0"
libexecdir = "/Users/yunus/ciddi-oyler/.stack-work/install/x86_64-osx/lts-10.3/8.2.2/libexec/x86_64-osx-ghc-8.2.2/ciddi-oyler-0.1.0.0"
sysconfdir = "/Users/yunus/ciddi-oyler/.stack-work/install/x86_64-osx/lts-10.3/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ciddi_oyler_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ciddi_oyler_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "ciddi_oyler_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "ciddi_oyler_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ciddi_oyler_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ciddi_oyler_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)


{-# LANGUAGE ForeignFunctionInterface #-}

{-|
Module      : System.Uptime
Description : System uptime library in Haskell
Copyright   : 2015, IMOKURI
License     : MIT
Maintainer  : nenegi.01mo@gmail.com
Stability   : experimental
Portability : POSIX

Library that returns system uptime in 1/100 seconds
-}

module System.Uptime (
-- * Functions
sysUpTime
) where

import Foreign.C.Types

foreign import ccall "get_uptime" c_getUpTime :: CLong

-- | sysUpTime returns system uptime in 1/100 seconds
sysUpTime :: IO Integer
sysUpTime = return $ fromIntegral c_getUpTime



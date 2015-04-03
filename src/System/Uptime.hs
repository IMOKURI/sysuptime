
{-# LANGUAGE ForeignFunctionInterface #-}

module System.Uptime
( upTime
) where

import Foreign.C.Types
import Foreign.Marshal.Alloc
import Foreign.Ptr

foreign import ccall "procps/proc/sysinfo.h uptime" c_upTime :: Ptr CDouble -> Ptr CDouble -> CInt

upTime :: IO Int
upTime = do
  uptime_secs <- malloc :: IO (Ptr CDouble)
  idle_secs   <- malloc :: IO (Ptr CDouble)

  return $ fromIntegral $ c_upTime uptime_secs idle_secs



module Main where

import System.Uptime
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sysUpTime" $ do
    it "returns positive number" $ do
      sysuptime <- sysUpTime
      sysuptime `shouldSatisfy` (>0)


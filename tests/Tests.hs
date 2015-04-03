
module Main where

import System.Uptime
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "Uptime" $ do
    it "Outputs current uptime" $
      c_uptime


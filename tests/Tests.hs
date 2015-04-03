
module Main where

import System.Uptime
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "upTime" $ do
    it "returns positive number" $ do
      uptime <- upTime
      uptime `shouldSatisfy` (>0)


{-# LANGUAGE Trustworthy #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Control.UsefulCombinators
-- Copyright   :  (c) Matthew Mirman 2012
-- License     :  GPL-3 
-- 
-- Maintainer  :  Matthew Mirman <mmirman@andrew.cmu.edu>
-- Stability   :  experimental
-- Portability :  portable
-- 
-- Some useful combinators
-----------------------------------------------------------------------------
module Control.UsefulCombinators where

composeN :: Num a => (b -> b) -> a -> b -> b
composeN _ 0 = id
composeN f i = f . composeN f (i-1)
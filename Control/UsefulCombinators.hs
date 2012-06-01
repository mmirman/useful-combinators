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
-- Some useful mostly simple combinators
-----------------------------------------------------------------------------
module Control.UsefulCombinators where

-- | @'composeN' f n@ composes @f@ with itself @n@ times
-- it has the invariant that @n '>=' 0@.
composeN :: (Eq a, Num a) => (b -> b) -> a -> b -> b
composeN _ 0 = id
composeN f i = f . composeN f (i-1)

infixr 0 <<$> 
-- | '<<$>' does the same thing as '<$>' or 'fmap' except that 
-- it has the same fixity as '$'.  This is often useful.
(<<$>) :: Functor f => (a -> b) -> f a -> f b
(<<$>) = fmap

-- | '-<$' can be used for peicing together functor bound results
infixr 0 -<$
(-<$) :: Functor f => (b -> c) -> f (a -> b) -> f (a -> c)
(-<$) = fmap . (.)



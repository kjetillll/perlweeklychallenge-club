#! /usr/bin/python3

import unittest

from math import sqrt,floor
from collections import deque

def genprimes(mx):
  primesh=set(range(2,4))
  for i in range(6,mx+2,6):
    for j in range(i-1,i+2,2):
      if j <= mx:
        primesh.add(j)
  q=deque([2,3,5,7])
  p=q.popleft()
  mr=floor(sqrt(mx))
  while p <= mr:
    if p in primesh:
      for i in range(p*p,mx+1,p):
        primesh.discard(i)
    if len(q) < 2:
      q.append(q[-1]+4)
      q.append(q[-1]+2)
    p=q.popleft()
  primes=list(primesh)
  primes.sort()
  return primes

def ltruncprimes(count):
  out=[]
  lt=0
  p=[str(i) for i in genprimes(500)]
  pp=set(p)
  for pc in p:
    l=len(pc)
    c=True
    for i in range(1,l):
      if not pc[i:l] in pp:
        c=False
        break
    if c:
      out.append(int(pc))
      lt += 1
      if lt >= count:
        break
  return out

class TestLtruncprimes(unittest.TestCase):

        def test_ex1(self):
          self.assertEqual(ltruncprimes(20),[2, 3, 5, 7, 13, 17, 23, 37, 43, 47, 53, 67, 73, 83, 97, 113, 137, 167, 173, 197],'example 1')

unittest.main()

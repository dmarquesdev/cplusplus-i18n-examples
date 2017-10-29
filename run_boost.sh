#!/bin/bash
g++ -std=c++14 -O2 -Wall -pedantic -pthread helloworld_boost.cpp -lboost_locale -o helloworld_boost

./helloworld_boost pt_BR
./helloworld_boost en_US
./helloworld_boost es_ES
#!/usr/bin/python
# -*- coding: UTF-8 -*-

import speedtest

servers = []
# If you want to test against a specific server
# servers = [1234]

threads = None
# If you want to use a single threaded test
# threads = 1

s = speedtest.Speedtest()
s.get_servers(servers)
loc = s.get_best_server()
results_dict = s.results.dict()
dl = s.download(threads=threads)
ul = s.upload(threads=threads)

print(str(loc['name']) + " " +str(loc['cc'])+ ':' + str(loc['sponsor']) + "(" + str((results_dict['client'])['ip']) + ")" + " <---> " + str(loc['host']))
print("Ping: {:.2f} ms\tDown: {:.3f} Mbit/s\tUp: {:.3f} Mbit/s".format(results_dict['ping'],dl/1024/1024,ul/1024/1024))

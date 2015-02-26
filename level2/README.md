# Level 2

## Getting started

As in Level 0, you can run this level using `test/harness` and you can it
submit for scoring using `git push`. Your goal is to create a defensive i
proxy that mitigates network traffic

## The simulation and scoring

### The layout of the simulated network

The network has three components: proxy (`shield`), backends, and
clients. The standard configuration, used for scoring and used by
`test/harness`, is to have a backend listen on port 3001 and a second
on 3002. Then `shield` connects to the two backends and listens on
port `3000`. Then `sword.js` is run, and it simulates a swarm of many
clients (some legitimate and some malicious) connecting to the proxy.

## The scoring

In the simulated environment, there are a large number of legitimate
clients making just a few requests each. There are also a small
number of malicious clients making an enormous number of requests
each. Think of these as mice and elephants: the goal of the level is
to let the mice through while keeping the elephants out.

The scoring simulation runs for 20 seconds. During that period, you
receive one point each time that you successfully proxy a response to
a request that was made by a mouse. At the end of the 20 seconds, you
lose points in proportion to the idleness of your backend boxes
(i.e. if you don't have an opportunity to proxy a mouse request, it is
better to proxy an elephant request than do nothing) [1]. The lowest
official score is 0.01 (there are no negative scores).

When the requests are coming in they are not labeled as
legitimate or malicious. However, the originating IP is
identified by the 'X-Forwarded-For' header on each packet. You can
determine, by watching the network whether an IP is malicious. A
given IP is either always malicious or always legitimate

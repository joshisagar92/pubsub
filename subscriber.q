\l kfk.q
kfk_cfg:`metadata.broker.list`statistics.interval.ms!`localhost:9092`10000
producer:.kfk.Producer[kfk_cfg]
test_topic:.kfk.Topic[producer;`test;()!()]
// define upd function
// this is the function invoked when the publisher pushes data to it
upd:{[tabname;tabdata];data:string[tabdata][0][`time];.kfk.Pub[test_topic;.kfk.PARTITION_UA;data;"time"]; }

// open a handle to the publisher
h:@[hopen;`::6812;{-2"Failed to open connection to publisher on port 6812: ",
                     x,". Please ensure publisher is running";
                     exit 1}]

// subscribe to the required data
// .u.sub[tablename; list of instruments]
// ` is wildcard for all
//h(`.u.sub;`;`)

h(`.u.sub;`meter;`)
\
Could also do (for example)

Subscribe to 10 syms of meter data:
h(`.u.sub;`meter;`reading)

Add subscriptions


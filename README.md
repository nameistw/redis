## Redis源码阅读

### 一、环境搭建(mac)

##### 1.安装 CLion

##### 2.下载源码
```
git clone https://github.com/nameistw/redis.git
```

##### 3.添加CMakeLists.txt文件，使用Clion    

1).在hiredis根目录下面添加CMakeLists.txt文件
```
add_library(hiredis STATIC hiredis.c net.c dict.c sds.c async.c read.c )
```    
    
2).在linenoise根目录下面添加CMakeLists.txt文件
```
add_library(linenoise linenoise.c)
```

3).在lua根目录下面添加CMakeLists.txt文件
```
set(LUA_SRC src/lapi.c src/lcode.c src/ldebug.c src/ldo.c src/ldump.c src/lfunc.c src/lgc.c src/llex.c src/lmem.c src/lobject.c src/lopcodes.c src/lparser.c src/lstate.c src/lstring.c src/ltable.c src/ltm.c src/lundump.c src/lvm.c src/lzio.c src/strbuf.c src/fpconv.c src/lauxlib.c src/lbaselib.c src/ldblib.c src/liolib.c src/lmathlib.c src/loslib.c src/ltablib.c src/lstrlib.c src/loadlib.c src/linit.c src/lua_cjson.c src/lua_struct.c src/lua_cmsgpack.c src/lua_bit.c ) 
add_library(lua STATIC ${LUA_SRC})
```

4).在deps根目录下面添加CMakeLists.txt文件
```
add_subdirectory(hiredis) 
add_subdirectory(linenoise) 
add_subdirectory(lua)
```

5).在src/modules根目录下面添加CMakeLists.txt文件
```
cmake_minimum_required(VERSION 3.9) 
set(CMAKE_BUILD_TYPE "Debug")
add_library(helloworld SHARED helloworld.c)
set_target_properties(helloworld PROPERTIES PREFIX "" SUFFIX ".so")
add_library(hellotype SHARED hellotype.c)
set_target_properties(hellotype PROPERTIES PREFIX "" SUFFIX ".so")
add_library(helloblock SHARED helloblock.c)
set_target_properties(helloblock PROPERTIES PREFIX "" SUFFIX ".so")
add_library(testmodule SHARED testmodule.c)
set_target_properties(testmodule PROPERTIES PREFIX "" SUFFIX ".so")
```

6).在redis根目录下面添加CMakeLists.txt文件
```
cmake_minimum_required(VERSION 3.0 FATAL_ERROR)
project(redis VERSION 4.0)
set(CMAKE_BUILD_TYPE "Debug")
get_filename_component(REDIS_ROOT "${CMAKE_CURRENT_SOURCE_DIR}" ABSOLUTE)
add_subdirectory(deps)
add_subdirectory(src/modules)
set(SRC_SERVER_TMP src/adlist.c src/ae.c src/anet.c src/ae_kqueue.c src/dict.c src/sds.c src/zmalloc.c src/lzf_c.c src/lzf_d.c src/pqsort.c src/zipmap.c src/sha1.c src/ziplist.c src/release.c src/networking.c src/util.c src/object.c src/db.c src/replication.c src/rdb.c src/t_string.c src/t_list.c src/t_set.c src/t_zset.c src/evict.c src/defrag.c src/module.c src/quicklist.c src/expire.c src/childinfo.c src/redis-check-aof.c src/redis-check-rdb.c src/lazyfree.c src/geohash.c src/rax.c src/geohash_helper.c src/siphash.c src/geo.c src/t_hash.c src/config.c src/aof.c src/pubsub.c src/multi.c src/debug.c src/sort.c src/intset.c src/syncio.c src/cluster.c src/crc16.c src/endianconv.c src/slowlog.c src/scripting.c src/bio.c src/rio.c src/rand.c src/memtest.c src/crc64.c src/bitops.c src/sentinel.c src/notify.c src/setproctitle.c src/blocked.c src/hyperloglog.c src/latency.c src/sparkline.c src/t_stream.c src/lolwut.c src/lolwut5.c src/listpack.c src/localtime.c )
set(SRC_SERVER src/server.c ${SRC_SERVER_TMP})
set(SRC_CLI src/anet.c src/sds.c src/adlist.c src/redis-cli.c src/zmalloc.c src/release.c src/anet.c src/ae.c src/crc64.c )
set(EXECUTABLE_OUTPUT_PATH src)
link_directories(deps/linenoise/ deps/lua/src deps/hiredis)
add_executable(redis-server ${SRC_SERVER})
target_include_directories(redis-server PRIVATE ${REDIS_ROOT}/deps/linenoise PRIVATE ${REDIS_ROOT}/deps/hiredis PRIVATE ${REDIS_ROOT}/deps/lua/src)
target_link_libraries(redis-server PRIVATE pthread PRIVATE m PRIVATE lua PRIVATE linenoise PRIVATE hiredis)
add_executable(redis-cli ${SRC_CLI})
target_include_directories(redis-cli PRIVATE ${REDIS_ROOT}/deps/linenoise PRIVATE ${REDIS_ROOT}/deps/hiredis PRIVATE ${REDIS_ROOT}/deps/lua/src)
target_link_libraries(redis-cli PRIVATE pthread PRIVATE m PRIVATE linenoise PRIVATE hiredis )
```

7).运行 redis-server，报错
```
/Users/klook/work/redis/src/ae_kqueue.c:41:24: error: unknown type name 'aeEventLoop'
static int aeApiCreate(aeEventLoop *eventLoop) {
```

在ae_kqueue.c文件中加入
```
#include "ae.h" 
#include "zmalloc.h"
```

8).继续运行，依旧报错
```
/Users/klook/work/redis/src/release.c:36:10: fatal error: 'release.h' file not found
#include "release.h"
         ^~~~~~~~~~~
1 error generated.
```

进入 src 目录， 执行脚本
```
sh mkreleasehdr.sh
```

9).再次运行， 即可成功启动 redis-server
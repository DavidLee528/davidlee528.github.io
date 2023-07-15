---
title: 'ThinkpadT480s内存升级到异构双通道40GB'
date: 2022-01-15
permalink: /posts/2022/01/t480s-ram-upgrade/
tags:
  - life
  - tech
---

大二学生，信息安全专业，平时用电脑比较多。这台ThinkpadT480s原来的内存配置是板载8GB+插槽8GB，共16GB，双通道DDR4-2400，处理器是intel i7-8650u。经常用到Chrome浏览器，VM虚拟机，WSL子系统，ABBYY Finereader，VSCode和VS等软件，内存占用轻松来到85%+，也常常接近100%，故下单镁光32GB-DDR4-2666MHz笔记本内存条，给机器做一次内存升级。

![任务管理器，内存占用很高](image.png)

经过几天的等待，内存条到货，安装后可以正常开机，开机后使用AIDA64和CPU-Z等软件进行了一些简单的测试，测试结果以图片的形式放在下面。

![镁光32G-DDR4-2666MHz笔记本内存条](image-1.png)

自己写了个简单的C程序来吃一吃内存，这个不算测试，算调皮：

```c
#include <stdio.h>
#include <stdlib.h>

int main() {
    while (malloc(1)) 
        ; 
    return 0; 
}
```

![内存占用变化情况](image-2.png)

下面是一些简单的测试信息：

![Alt text](image-3.png)

![Alt text](image-4.png)

![Alt text](image-5.png)

![Alt text](image-6.png)

![Alt text](image-7.png)

至此，测试完成。电脑用户手册说最大24G（板载8G+插槽16G），处理器参数页说最大32G（板载8G+插槽16G），实测40G（板载8G+插槽32G）可用，但是memory latency偏高。

![Alt text](image-8.png)
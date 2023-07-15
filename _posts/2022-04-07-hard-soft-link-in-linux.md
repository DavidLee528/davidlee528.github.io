---
title: '简单了解Linux系统中的软链接与硬链接'
date: 2022-04-07
permalink: /posts/2022/04/hard-soft-link-in-linux/
tags:
  - tech
---

在Linux系统中进行工作时，常常遇到软链接与硬链接，它们的区别是什么呢？

## 什么是inode

“inode”实际上是“index node”的缩写，它描述了在类Unix系统中的一个文件系统对象（如一个文件或目录）。在GNU/Linux文件系统中，每个文件和目录均需被分配一个inode，不存储任何实际的数据。每个inode都存储着对象数据的属性以及在磁盘块位置，其中对象数据的属性可能包含元数据（最后修改时间，权限，修改）以及所有者和许可数据。

## 了解两种链接类型

在Linux/Unix系统中，存在两种链接类型，分别是：

- 硬链接（Hard links）：可以这样理解，硬链接就是某个文件实体的别名。硬链接甚至可以使多个文件名拥有相同的inode，你可以为单个文件创建多个硬链接。在不同的文件系统中，inode可能产生冲突，所以不能为不同文件系统或分区的目录和文件创建硬链接。

- 软链接（Soft links, Symbolic links）：就像在Windows系统中创建快捷方式一样，创建软链接实际上相当于创建一个指向某个文件实体指针变量，可以为不同文件系统或分区的目录创建软链接。

## 创建链接

使用`ln`命令来创建链接，`ln`是link的缩写，其使用方法如下：

```shell
$ ln [options] FILE_NAME LINK_NAME
```

## 两种链接方式的区别

从使用的角度出发，两种链接方式并无区别。我们可以通过一个简单的例子来了解相对底层的原理区别。

首先创建一个文件`file`并向其写入一个字符串`hello`：

```shell
$ touch file && echo "hello" > file
$ cat file
hello
183 -rw-r--r--  1 david david    6 Apr  7 12:26 file
```

使用`ln`命令为`file`创建一个硬链接`hard_link`：

$ ln file hard_link
$ ls -li  # l for list & i for inode
183 -rw-r--r--  2 david david    6 Apr  7 12:26 file
183 -rw-r--r--  2 david david    6 Apr  7 12:26 hard_link
$ cat hard_link
hello

可以看到，最左侧一列的`183`就是文件inode值。我们尝试通过创建的硬链接来修改文件：

```shell
$ echo "hello, world!" > hard_link
$ cat hard_link
hello, world!
$ cat file
hello, world!
```

在使用`ln`命令为`file`创建一个软链接`symbolic_link`：

```shell
$ ln -s file symbolic_link
$ ls -li
183 -rw-r--r--  2 david david    6 Apr  7 12:26 file
183 -rw-r--r--  2 david david    6 Apr  7 12:26 hard_link
459 lrwxrwxrwx  1 david david    4 Apr  7 12:39 symbolic_link -> file
$ echo "qwertyuiop" > symbolic_link
$ cat symbolic_link
qwertyuiop
$ cat file
qwertyuiop
$ cat hard_link
qwertyuiop
```

可以看到，软链接拥有不同的inode值459，并且文件属性上的l-flag说明其与之前创建的两个文件并不是一个类型。下面尝试删除原始文件file后再次访问硬链接和软链接：

```shell
$ rm file
$ cat hard_link
qwertyuiop
$ cat symbolic_link
cat: symbolic_link: No such file or directory
```

- 硬链接`hard_link`：不受影响，可以访问。因为仍然有一个硬链接在指向原始文件所指向的区块（即值为183的inode所指向的区块），所以此区块仍然是有效的，可以被访问到。
 
- 软链接`symbolic_link`：受到影响，不可访问。因为软链接只是保存了一个绝对路径，当用户访问软链接的时候，系统会自动替换成被访问到软链接所指向的文件绝对路径，此时该路径对应的文件不存在，则无法显示该文件。

继续做个小实验：

```shell
$ echo "hhhhh" > symbolic_link
$ ls -li
232915 -rw-r--r--  1 david david    6 Apr  7 12:56 file
   183 -rw-r--r--  1 david david   11 Apr  7 12:44 hard_link    
   459 lrwxrwxrwx  1 david david    4 Apr  7 12:39 symbolic_link -> file
$ cat file
hhhhh
$ cat hard_link
qwertyuiop
```

系统在软链接`symbolic`中保存的绝对路径处创建了一个新的文件`file`。

最后，一图胜千言，我们通过下面这张图来清晰的认识软链接与硬链接之间的关系。

![Hard Link and Soft Link](image.png)


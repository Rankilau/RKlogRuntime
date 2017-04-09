# RKlogRuntime
![](https://github.com/Rankilau/RKlogRuntime/raw/master/RKLogRuntime.jpeg)<br>
RKlogRuntime 快速入门
========
在使用中有任何问题都可以提issue，同时也欢迎提PR。

导航<br>
[简介](#简介)<br>
[使用方法](#使用方法)<br>
[常见问题](#常见问题)<br>
[将要做的](#将要做的)<br>

![](https://github.com/Rankilau/RKlogRuntime/raw/master/logruntime.gif)<br>

简介
---
RKlogRuntime是一个免费且开源的无痕埋点方法，实现按钮点击事件无痕埋点，viewcontroller的pv无痕埋点。目的是给开发者提供一个无痕埋点案。
获取项目
git clone git@github.com:Rankilau/RKlogRuntime.git

集成效果

使用方法
---
RKlogRuntime支持一种方式导入您的项目中：
1、手动集成

手动集成
---
第一步：<br>
将项目结构中的kit这个核心库文件夹拖拽到项目中<br>
第二步：<br>
添加第三方依赖库：<br>
Masonry v1.0.1<br>

常见问题
---

RKlogRuntime组件收费吗？
---
RKlogRuntime是完全开源并且免费给开发者使用。

接入RKlogRuntime有什么好处？
---
组件可以实现无痕埋点，对代码侵蚀性减到最小；实现动态下发埋点逻辑，防止遗漏重要埋点，影响业务统计。

[我的博客](www.baidu.com)

将要做的
---
实现服务器下发埋点配置文件<br>
支持pod集成功能<br>
完善日志上传引擎，支持可配置上传选项，比如30个埋点时上传一次，或者是5分钟上传一次<br>
归纳core文件夹，便于读者入读<br>
做博客主页<br>

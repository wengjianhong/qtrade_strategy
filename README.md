# qtrade_strategy

策略插件仓库：产出可被 `qtrade_client` / `IEngine::LoadStrategiesFromPlugins` 加载的 `.so`。

**依赖**已安装的 `qtrade_engine`（`find_package(qtrade_engine)`）。

## 构建

```bash
cmake -B build \
  -DCMAKE_INSTALL_PREFIX=/usr/local/qtrade \
  -DCMAKE_PREFIX_PATH="/usr/local/cpputils;/usr/local/qtrade"
cmake --build build -j1
sudo cmake --install build
```

安装后策略位于：`${CMAKE_INSTALL_PREFIX}/lib/strategies/`（例如 `libexample_strategy.so`）。

## 新增策略

1. 在 `strategies/<name>/` 实现 `IStrategy` 与 `strategy_plugin_abi.h` 导出
2. 新增 `cmake/<name>.cmake`（可参考 `cmake/example_strategy.cmake`）
3. 在根 `CMakeLists.txt` 中 `include` 该 cmake

ABI 约定见已安装头文件：`qtrade/strategy/strategy_plugin_abi.h`。

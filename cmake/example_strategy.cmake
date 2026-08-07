# ---------------------------------------------------------------------------
# Strategy plugin: example_strategy → libexample_strategy.so
# ---------------------------------------------------------------------------

set(_EXAMPLE_DIR ${QTRADE_STRATEGY_ROOT}/example_strategy)

add_library(example_strategy SHARED
  ${_EXAMPLE_DIR}/example_strategy.cpp
  ${_EXAMPLE_DIR}/example_strategy_plugin.cpp
)

target_include_directories(example_strategy PRIVATE
  ${_EXAMPLE_DIR}
)

target_link_libraries(example_strategy PRIVATE
  qtrade_engine::qtrade_engine
)

target_compile_options(example_strategy PRIVATE -fvisibility=hidden)

set_target_properties(example_strategy PROPERTIES
  LIBRARY_OUTPUT_DIRECTORY ${QTRADE_STRATEGY_PLUGIN_OUTPUT_DIR}
  OUTPUT_NAME example_strategy
  BUILD_RPATH "\$ORIGIN"
)

install(TARGETS example_strategy
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}/strategies
)

unset(_EXAMPLE_DIR)

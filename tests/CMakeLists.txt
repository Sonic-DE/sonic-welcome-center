add_executable(mockclocktest mockclocktest.cpp)
target_link_libraries(mockclocktest PRIVATE Qt6::QuickTest Qt6::Test)
add_test(NAME mockclocktest COMMAND mockclocktest -input ${CMAKE_CURRENT_SOURCE_DIR}/mockclock)
set_tests_properties(mockclocktest PROPERTIES ENVIRONMENT "QT_QPA_PLATFORM=offscreen")

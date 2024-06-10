# CMake generated Testfile for 
# Source directory: /ros2_ws/src/cc_car
# Build directory: /ros2_ws/src/cc_car/build/cc_car
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(copyright "/usr/bin/python3" "-u" "/opt/ros/dashing/share/ament_cmake_test/cmake/run_test.py" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/copyright.xunit.xml" "--package-name" "cc_car" "--output-file" "/ros2_ws/src/cc_car/build/cc_car/ament_copyright/copyright.txt" "--command" "/opt/ros/dashing/bin/ament_copyright" "--xunit-file" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/copyright.xunit.xml")
set_tests_properties(copyright PROPERTIES  LABELS "copyright;linter" TIMEOUT "60" WORKING_DIRECTORY "/ros2_ws/src/cc_car")
add_test(cppcheck "/usr/bin/python3" "-u" "/opt/ros/dashing/share/ament_cmake_test/cmake/run_test.py" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/cppcheck.xunit.xml" "--package-name" "cc_car" "--output-file" "/ros2_ws/src/cc_car/build/cc_car/ament_cppcheck/cppcheck.txt" "--command" "/opt/ros/dashing/bin/ament_cppcheck" "--xunit-file" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/cppcheck.xunit.xml")
set_tests_properties(cppcheck PROPERTIES  LABELS "cppcheck;linter" TIMEOUT "120" WORKING_DIRECTORY "/ros2_ws/src/cc_car")
add_test(cpplint "/usr/bin/python3" "-u" "/opt/ros/dashing/share/ament_cmake_test/cmake/run_test.py" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/cpplint.xunit.xml" "--package-name" "cc_car" "--output-file" "/ros2_ws/src/cc_car/build/cc_car/ament_cpplint/cpplint.txt" "--command" "/opt/ros/dashing/bin/ament_cpplint" "--xunit-file" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/cpplint.xunit.xml")
set_tests_properties(cpplint PROPERTIES  LABELS "cpplint;linter" TIMEOUT "120" WORKING_DIRECTORY "/ros2_ws/src/cc_car")
add_test(lint_cmake "/usr/bin/python3" "-u" "/opt/ros/dashing/share/ament_cmake_test/cmake/run_test.py" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/lint_cmake.xunit.xml" "--package-name" "cc_car" "--output-file" "/ros2_ws/src/cc_car/build/cc_car/ament_lint_cmake/lint_cmake.txt" "--command" "/opt/ros/dashing/bin/ament_lint_cmake" "--xunit-file" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/lint_cmake.xunit.xml")
set_tests_properties(lint_cmake PROPERTIES  LABELS "lint_cmake;linter" TIMEOUT "60" WORKING_DIRECTORY "/ros2_ws/src/cc_car")
add_test(uncrustify "/usr/bin/python3" "-u" "/opt/ros/dashing/share/ament_cmake_test/cmake/run_test.py" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/uncrustify.xunit.xml" "--package-name" "cc_car" "--output-file" "/ros2_ws/src/cc_car/build/cc_car/ament_uncrustify/uncrustify.txt" "--command" "/opt/ros/dashing/bin/ament_uncrustify" "--xunit-file" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/uncrustify.xunit.xml")
set_tests_properties(uncrustify PROPERTIES  LABELS "uncrustify;linter" TIMEOUT "60" WORKING_DIRECTORY "/ros2_ws/src/cc_car")
add_test(xmllint "/usr/bin/python3" "-u" "/opt/ros/dashing/share/ament_cmake_test/cmake/run_test.py" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/xmllint.xunit.xml" "--package-name" "cc_car" "--output-file" "/ros2_ws/src/cc_car/build/cc_car/ament_xmllint/xmllint.txt" "--command" "/opt/ros/dashing/bin/ament_xmllint" "--xunit-file" "/ros2_ws/src/cc_car/build/cc_car/test_results/cc_car/xmllint.xunit.xml")
set_tests_properties(xmllint PROPERTIES  LABELS "xmllint;linter" TIMEOUT "60" WORKING_DIRECTORY "/ros2_ws/src/cc_car")

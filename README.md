# iPhoneXRespectDemo

```        
        /*
            0. 通过keyWindow获取SafeArea
         
            1. 在iOS11中有SafeArea的概念，
                1.1. 在iPhoneX中SafeArea是距离边框的距离，分横屏、竖屏
                1.2. 除了iPhoneX其他设备没有刘海问题
         
            2. 顶部使用nav+sts的高度
                2.1. 在 iOS < 11 中只管nav+sts
                2.2. 在 iOS >= 11 中只管iPhoneX的safeArea
         
            3. SafeArea 大小，取safeAreaInsets
                3.1 在iPhoneX中分竖屏横屏
                    竖屏：portrait --> insets{44, 0, 34, 0}
                    横屏：landscape --> insets{0, 44, 21, 44}
                3.2 非iPhoneX的均为 insets{0, 0, 0, 0}
         
            4. navHeight、tabHeight和stsHeight不同
                4.1 在iPhoneX中分竖屏横屏
                     竖屏：portrait --> {
                             navHeight = 44
                             tabHeight = 83 = 49 + 34
                             stsHeight = 44
                     }
                     横屏：landscape --> {
                             navHeight = 32
                             tabHeight = 53
                             stsHeight = 0
                     }
                4.2 非iPhoneX的为
                     竖屏：portrait --> {
                            navHeight = 44
                            tabHeight = 49
                            stsHeight = 20
                     }
                     横屏：landscape --> {
                            navHeight {
                                !plus = 32
                                 plus = 44
                            }
                            tabHeight {
                                 ios 11 && !plus = 32
                                 其他 = 49
                            }
                            stsHeight = 0
                     }
         
            5. iOS 11时 iPhoneX 的安全边距已经将statueBar涵盖，其他没有情况没涵盖
         
         */

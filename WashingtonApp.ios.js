import {Alert, Dimensions, StyleSheet, Text, TouchableOpacity, View, NativeModules} from 'react-native';
import {Component} from 'react';
import CodePush from '@watchman9527/react-native-washington-push';
import NetInfo from '@react-native-community/netinfo';
import React from 'react';
import SplashScreen from 'react-native-splash-screen';
import Toast from 'react-native-root-toast';

class WashingtonApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      visible: false,
      receivedBytes: 0,
      totalBytes: 0,
      isCalledUpdateMethod: false,
    };
  }

  _handleUpdate = async () => {
    console.log('检查更新');
    const updateMessage = (await CodePush.checkForUpdate()) || {};
    console.log(updateMessage);
    await CodePush.sync(
      {
        installMode: CodePush.InstallMode.IMMEDIATE,
        mandatoryInstallMode: CodePush.InstallMode.IMMEDIATE,
        rollbackRetryOptions: {
          maxRetryAttempts: 3,
        },
      },
      // 第二个参数，更新状态检测，返回数字
      //0 已经是最新，1 安装完成、等待生效，2 忽略更新，3 未知错误，4 已经在下载了，5 查询更新，6 弹出了更新确认界面，7 下载中，8下载完成
      status => {
        switch (status) {
          case 0:
            console.log('已经是最新');
            break;
          case 1:
            !updateMessage.isMandatory && alert('更新完成, 再启动APP更新即生效');
            break;
          case 3:
            alert('出错了，未知错误');
            break;
          case 7:
            this.setState({visible: true});
            break;
          case 8:
            this.setState({visible: false});
            break;
        }
      },
      // 第三个参数，检测下载过程
      ({receivedBytes, totalBytes}) => {
        this.setState({
          receivedBytes: (receivedBytes / 1024).toFixed(2),
          totalBytes: (totalBytes / 1024).toFixed(2),
        });
      },
    );
  };

  handleUpdate = () => {
    this._handleUpdate().catch(error => {
      alert(error.message);
    });
  };

  componentDidMount() {
    SplashScreen.hide();

    this.unsubscribe = NetInfo.addEventListener(state => {
      if (state.isConnected) {
        if (!this.state.isCalledUpdateMethod) {
          this.setState({isCalledUpdateMethod: true});
          this.handleUpdate();
        }
      }
    });
  }

  componentWillUnmount() {
    this.unsubscribe();
  }

  render() {
    return (
      <View style={styles.contfdsaainer}>
        {!this.state.visible ? (
          <TouchableOpacity
            style={styles.update23Tips}
            onPress={() => {
              if (this.state.receivedBytes < 100) {
                this.handleUpdate();
              }
            }}>
            <Text style={{fontSize: 16, color: 'black'}}>点击更新</Text>
          </TouchableOpacity>
        ) : null}
        <Toast visible={this.state.visible} position={Dimensions.get('window').height / 2 - 20} shadow={false} animation={false}>
          下载中: {Math.round((this.state.receivedBytes / this.state.totalBytes) * 100 * 100) / 100 || 0}%
        </Toast>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  update23Tips: {
    marginTop: 22,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5F5F5',
    borderRadius: 24,
    width: 220,
    height: 48,
  },

  contfdsaainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
  },
});

export default WashingtonApp;

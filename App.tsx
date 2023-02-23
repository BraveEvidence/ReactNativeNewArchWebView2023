/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import type {PropsWithChildren} from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  useWindowDimensions,
  View,
} from 'react-native';

import {
  Colors,
  DebugInstructions,
  Header,
  LearnMoreLinks,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';
import RTNMyWebViewNativeComponent from 'rtn-my-web-view/js/RTNMyWebViewNativeComponent';

function App(): JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  const {width, height} = useWindowDimensions();

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <Text>Below is a webview</Text>
      <RTNMyWebViewNativeComponent
        url="https://facebook.com"
        style={{
          width,
          height,
        }}
      />
    </SafeAreaView>
  );
}

export default App;

//yarn add ./RTNMyWebView

//node rnappweb/node_modules/react-native/scripts/generate-codegen-artifacts.js \
// --path rnappweb/ \
// --outputPath rnappweb/RTNMyWebView/generated/

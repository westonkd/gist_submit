import React from 'react'
import '@instructure/canvas-theme'

import { Text } from '@instructure/ui-elements'
import { Heading } from '@instructure/ui-elements'
import { Button } from '@instructure/ui-buttons'
import { View } from '@instructure/ui-layout'
import { IconGithubLine } from '@instructure/ui-icons'

const Form = props => {
  return(
    <View>
      <View textAlign="center">
        <Heading level="h3" margin="large 0 small 0">Please Sign In</Heading>
      </View>
      <View textAlign="center">
        <div style={{textAlign: 'center'}}>
          <Text>Gist Submit requires a GitHub account to use.</Text>
        </div>
      </View>
      <View>
        <div style={{textAlign: 'center'}}>
          <Button icon={IconGithubLine} href={props.loginPath} margin="large 0 0 0">Login</Button>
        </div>
      </View>
    </View>
  )
}

export default Form
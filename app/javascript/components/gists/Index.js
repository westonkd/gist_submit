import React from 'react'
import '@instructure/canvas-theme'

import { Text } from '@instructure/ui-elements'
import { TreeBrowser } from '@instructure/ui-tree-browser'
import { View } from '@instructure/ui-layout'

const Index = props => {
  const collections = () => {
    return {
      1: {
        id: 1,
        name: "GitHub",
        items: Object.keys(items()),
        descriptor: "Your Gists"
      }
    }
  }

  const gistItems = () => {
    return props.gists.map((gist, index) => {
      const file = gist.files[Object.keys(gist.files)[0]]

      return {
        id: index,
        name: `${gist.description || file.filename} (${file.language || "Unkown Language"})`
      }
    })
  }

  const items = () => {
    return gistItems()
  }

  return(
    <View width="100%">
      <Text>
        Please select a Gist to submit:
      </Text>
      <TreeBrowser
        collections={collections()}
        items={items()}
        defaultExpanded={[1]}
        rootId={1}
      />
    </View>
  )
}

export default Index
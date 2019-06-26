import React from 'react'
import '@instructure/canvas-theme'

import { Text } from '@instructure/ui-elements'
import { TreeBrowser } from '@instructure/ui-tree-browser'
import { View } from '@instructure/ui-layout'
import { submitForm } from '../shared/RequestUtils'

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
        name: `${gist.description || file.filename} (${file.language || "Unkown Language"})`,
        url: gist.url,
        html_url: gist.html_url
      }
    })
  }

  const items = () => {
    return gistItems()
  }

  const success = () => {
    alert("Submission Created")
  }

  const error = () => {
    alert("There was an error creating your submission")
  }

  const submitGist = (item) => {
    const gist = items()[item.id]
    console.log(gist)
    submitForm({

    }, props.create_scores_url, success, error)
  }

  return(
    <View width="100%">
      <View margin="0 0 large 0">
        <Text>
          Please select a Gist to submit:
        </Text>
      </View>
      <TreeBrowser
        collections={collections()}
        items={items()}
        defaultExpanded={[1]}
        rootId={1}
        onItemClick={submitGist}
      />
    </View>
  )
}

export default Index
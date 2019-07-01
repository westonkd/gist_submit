import React, { useState } from 'react'
import '@instructure/canvas-theme'

import { Heading } from '@instructure/ui-elements'
import { View } from '@instructure/ui-layout'
import { ToggleGroup } from '@instructure/ui-toggle-details'
import { CodeEditor } from '@instructure/ui-code-editor'
import { Button } from '@instructure/ui-buttons'

import CreateAssignment from './CreateAssignment'

const Show = props => {
  console.log(props)
  return (
    <View>
      <Heading level="h1">{props.assignment.title}</Heading>
      <Heading level="h2">{`Due at ${props.assignment.due_date}`}</Heading>
      <Heading margin="large 0 medium 0" level="h3">Submissions</Heading>
      {
        props.submissions.map(submission => (
          <ToggleGroup
            toggleLabel={submission.user_name}
            summary={submission.user_name}
            key={submission.url}
          >
            <View display="block" padding="small">
            <CodeEditor
              label='code editor'
              defaultValue={submission.content}
              options={{ lineNumbers: true }}
            />
            </View>
          </ToggleGroup>
        ))
      }
      <Button variant="primary" margin="medium 0 0 0">
        Retrieve All Users
      </Button>
    </View>
  )
}

export default Show
import React, { useState } from 'react'
import '@instructure/canvas-theme'

import { Billboard } from '@instructure/ui-billboard'
import { Heading } from '@instructure/ui-elements'
import { View, DrawerLayout } from '@instructure/ui-layout'
import { IconPlusLine } from '@instructure/ui-icons'
import { CloseButton } from '@instructure/ui-buttons'

import CreateAssignment from './CreateAssignment'

const Index = props => {
  const [trayOpen, setTrayOpen] = useState(false)
  console.log(props)
  return (
    <View
      height="100rem"
      as="div"
      background="default"
      style={{ position: 'relative' }}
    >
      <DrawerLayout>
        <DrawerLayout.Tray
          id="DrawerLayoutTrayExample1"
          open={trayOpen}
          placement="start"
          label="Drawer Tray Start Example"
          onDismiss={() => { setTrayOpen(false) }}
        >
          <View
            as="div"
            maxWidth="16rem"
            textAlign="center"
            margin="large auto"
            padding="small"
          >
            <CloseButton
              placement="end"
              offset="small"
              variant="icon"
              onClick={() => { setTrayOpen(false) }}
            >
              Close
              </CloseButton>
            <CreateAssignment createUrl={props.create_assignments_url} assignments={props.assignments} />
          </View>
        </DrawerLayout.Tray>
        <DrawerLayout.Content label="Drawer content example">
          <Heading margin="0 0 medium medium">
            Gist Submit Assignments
          </Heading>
          {
            props.assignments.map(assignment => {
              const dueDate = new Date(assignment.due_date)
              return <View as="div" display="inline-block" width="400px" key={assignment.lti_id}>
                <Billboard
                  theme={{ backgroundColor: '#F5F5F5' }}
                  height="170px"
                  margin="small"
                  href={props.show_assignments_url.replace(":lti_id", assignment.lti_id)}
                  hero={
                    <View>
                      <Heading level="h3">{assignment.title}</Heading>
                      <Heading margin="large 0 0 0" level="h4">{`Due ${dueDate.toDateString()} at ${dueDate.toTimeString().split('GMT')[0]}`}</Heading>
                    </View>
                  }
                />
              </View>
            })
          }
          <View as="div" display="inline-block" width="400px">
            <Billboard
              margin="small"
              hero={(size) => <IconPlusLine size={size} />}
              onClick={() => { setTrayOpen(true) }}
              message="Create New Assignment"
            />
          </View>
        </DrawerLayout.Content>
      </DrawerLayout>
    </View>
  )
}

export default Index
import React, { useState } from 'react'
import { View } from '@instructure/ui-layout'
import { TextInput } from '@instructure/ui-text-input'
import { Heading } from '@instructure/ui-elements'
import { Button } from '@instructure/ui-buttons'
import { submitForm } from '../shared/RequestUtils'

const CreateAssignment = props => {
  const courseIds = () => ([...new Set(props.assignments.map(a => (a.lti_course_id)))])

  const [name, setName] = useState("")
  const [dueDate, setDueDate] = useState(new Date().toISOString())
  const [pointsPossible, setPointsPossible] = useState(100)
  const [courseId, setCourseId] = useState(courseIds()[0])

  const error = (error) => {
    console.error(error)
  }

  const success = (response) => {
    alert("Created Assignment")
    console.log(response)
  }

  const formData = () => ({
    name,
    due_date: dueDate,
    points_possible: pointsPossible,
    course_id: courseId
  })

  const submit = () => {
    submitForm(
      formData(),
      props.createUrl,
      success,
      error
    )
  }

  return(
    <React.Fragment>
      <Heading level="h3" margin="0 0 x-small">New Assignment</Heading>
      <form>
        <View display="block" margin="medium 0 0 0">
          <TextInput
            value={name}
            label="Name"
            layout="stacked"
            onChange={(e) => {setName(e.currentTarget.value)}}
          />
        </View>
        <View display="block" margin="medium 0 0 0">
          <TextInput
            value={dueDate}
            label="Due Date"
            layout="stacked"
            onChange={(e) => {setDueDate(e.currentTarget.value)}}
          />
        </View>
        <View display="block" margin="medium 0 0 0">
          <TextInput
            value={pointsPossible}
            label="Points Possible"
            layout="stacked"
            onChange={(e) => {setPointsPossible(e.currentTarget.value)}}
          />
        </View>
        <View display="block" margin="medium 0 0 0">
          <TextInput
            value={courseId}
            label="Course"
            layout="stacked"
            onChange={(e) => {setCourseId(e.currentTarget.value)}}
          />
        </View>
        <Button variant="primary" margin="medium 0 0 0" fluidWidth onClick={submit}>
          <View display="block" textAlign="center">Create Assignment</View>
        </Button>
      </form>
    </React.Fragment>
  )
}

export default CreateAssignment
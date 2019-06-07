import axios from 'axios'

const submitForm = async (data, endpoint, success, handleError) => {
  try {
    const response = await axios.post(endpoint, data);
    success(response)
  } catch (error) {
    handleError(error)
  }
}

export { submitForm }
import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
import createLogger from 'redux-logger';



const preloadedState = {
  notes: [],
  tracks: {},
  isRecording: false,
  isPlaying: false
 }

const logger = createLogger()


const configureStore = (preloadedState) => (
  createStore(
    rootReducer,
    preloadedState
  )
);

export default configureStore;

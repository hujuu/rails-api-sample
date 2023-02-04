import logo from './logo.svg';
import './App.css';
import {Routes, Route} from 'react-router-dom';

// components
import {Restaurants} from './containers/Restaurants.jsx';
import {Foods} from './containers/Foods.jsx';
import {Orders} from './containers/Orders.jsx';


function App() {
    return (
        <div className="App">

            <Routes>
                <Route path="/restaurants" element={<Restaurants/>}/>
                <Route path="/foods" element={<Foods/>}/>
                <Route path="/orders" element={<Orders/>}/>
                <Route path="/restaurants/:restaurantsId/foods" element={<Foods/>}/>
            </Routes>
        </div>
    );
}

export default App;

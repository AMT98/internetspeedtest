import React, {useState, useEffect} from "react";
import ReactDOM from "react-dom/client";

function PlacesList() {
  
}

class PlacesList extends React.Component {
  render() {
    return <div>Places list rendered in react!</div>;
  }
}

const placesList = ReactDOM.createRoot(
  document.getElementById("places-list-container")
);
placesList.render(<PlacesList />);

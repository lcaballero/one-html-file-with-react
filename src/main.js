const { useState } = React

const Item = ({name, changeName}) => {
  return <li onClick={()=>changeName(name)}>{name}</li>
}

const names = ["world", "batman", "superman", "wonder woman"]
const Greeting = () => {
  const [name, changeName] = useState(() => {
    console.log("use state")
    return "world"
  })
  const updateName = (event) => {
    console.log('event:', event)
    //changeName(newName)
  }
  return <div>
  <ul className="choices">
  {
    names.map(name => <Item {...{name, changeName}} />)
  }
  </ul>
  <p>Hello, {name}!</p>
  </div>
}

ReactDOM.render(
  <Greeting />,
  document.getElementById('root')
);

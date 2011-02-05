import android.app.Activity
import android.util.Log
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.ListView
import android.widget.TextView
import android.widget.Toast
import java.lang.CharSequence
import java.util.ArrayList


class Todo < Activity
  def onCreate(state)
    super state
    self_ = self
    setContentView R.layout.main

    @add_button = Button(findViewById(R.id.add_button))
    @new_todo_entry = EditText(findViewById(R.id.new_todo_entry))
    @add_button.setOnClickListener do |view|
      self_.add_todo
    end

    @adapter = TodoList.new
    @adapter.add("foo")
    @adapter.add("bar")
    
    @list = ListView(findViewById(R.id.list))
    @list.setAdapter @adapter
  end

  def add_todo
    @adapter.add @new_todo_entry.getText.toString
    @new_todo_entry.setText('')
  end

  def toast(msg:String)
    Toast.makeText(self, msg, Toast.LENGTH_LONG).show
  end
end

class TodoList < BaseAdapter
  def initialize
    @items = ArrayList.new
  end

  def add(item:String)
    @items.add item
  end

  def getCount
    @items.size
  end

  def getItem(position:int) 
    String(@items.get(position))
  end

  def getItemId(position:int)
    long(getItem(position).hashCode)
  end

  def getView(position:int, view:View, parent:ViewGroup)
    Log.i "TodoList", "Get View"
    # TODO reuse view
    text_view = TextView.new parent.getContext
    text_view.setText CharSequence(getItem(position))
    View(text_view)
  end
end

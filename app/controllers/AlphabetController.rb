# coding: utf-8
class AlphabetController < UIViewController
  def viewDidLoad
    super

    self.title = "アルファベット"

    @data = ("A".."Z").to_a

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview @table
    
    @table.dataSource = self
    @table.delegate = self
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    puts "cellForRowAtIndexPath"
    puts indexPath.row
    puts @data[indexPath.row]

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) ||
           begin
             UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuseIdentifier)
           end
    cell.textLabel.text = @data[indexPath.row]
    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)

    alert = UIAlertView.alloc.init
    alert.message = "#{@data[indexPath.row]}を押したぞ!"
    alert.addButtonWithTitle "OK"
    alert.show
    puts "alert complete"
  end

end

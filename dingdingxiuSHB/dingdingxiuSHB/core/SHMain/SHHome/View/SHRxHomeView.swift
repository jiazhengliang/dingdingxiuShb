
import UIKit
import SnapKit
import RxSwift
class SHRxHomeView: SHView {

    var viewModel: HJHomeViewModel
    
    var homeHeaderView: HJHomeTableHeaderView?
    var sectionHeaderView: HJHomeTableSectionView?
    
    lazy var mainTableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = self.homeHeaderView
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.register(HJHomeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HJHomeTableViewCell.self))
        tableView.mj_header = MJRefreshNormalHeader {
            self.viewModel.refreshDataRequest.onNext("下拉刷新")
        }
        tableView.mj_footer = MJRefreshBackNormalFooter {
            self.viewModel.nextPageDataRequest.onNext("上拉加载")
        }
//
//        //2. 将数据源与 tableView 绑定
//
//        self.viewModel.dataArrayObservable?.bind(to: tableView.rx.items(cellIdentifier: NSStringFromClass(HJHomeTableViewCell.self), cellType: HJHomeTableViewCell.self))
//
//
//
//        self.viewModel.dataArrayObservable.bind(to: tableView.rx
//            .items(cellIdentifier: "Cell", cellType: HJHomeTableViewCell.self)) { (row, text, cell) in
//
////                cell
////                cell.textLabel?.text = text
//        }.disposed(by: self.dispoaseBag)
//
//        //3. 绑定 tableView 的事件
//        tableView.rx.itemSelected.bind { (indexPath) in
//            print(indexPath)
//        }.disposed(by: self.disposeBag)

      
        
        return tableView
    }()
    
    
    
    init(viewModel: HJHomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func updateConstraints() {
        
        mainTableView.snp.makeConstraints { [unowned self] (make) in
            make.edges.equalTo(self)
        }
        super.updateConstraints()
        
    }
    
    
    override func hj_setupViews() {
        
        
        homeHeaderView = HJHomeTableHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 160), viewModel: viewModel.homeHeaderViewModel)
        
        sectionHeaderView = HJHomeTableSectionView(viewModel: viewModel.sectionHeaderViewModel)
        
        addSubview(mainTableView)
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    override func hj_bindViewMode() {
        
        viewModel.refreshDataRequest.onNext("请求数据")
        /// 刷新UI
        viewModel.refreshUI.observeOn(MainScheduler.instance).subscribe { [weak self] (event) in
            print("table view reload data \(Thread.current)")
            self?.mainTableView.reloadData()
//            self?.homeHeaderView?.collectionView?.reloadData()
            //            switch event {
            //            case .next(_):
            //                print("刷新列表")
            //                self?.mainTableView.reloadData()
            //            default:
            //                break
            //            }
        }.disposed(by: self.dispoaseBag)
        
        /// 上拉/下拉状态
        viewModel.refreshEndSubject.observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] (status) in
            
            print("上拉/下拉状态刷新 \(Thread.current)")
            print("修改上拉加载状态:\(status)")
            
            switch status {
            case .HJHeaderRefresh_hasMoreData:
                self?.mainTableView.mj_header?.endRefreshing()
                if self?.mainTableView.mj_header == nil {
                    self?.mainTableView.mj_footer = MJRefreshBackNormalFooter {
                        self?.viewModel.nextPageDataRequest.onNext("上拉加载")
                    }
                }
            case .HJHeaderRefresh_hasNoMoreData:
                self?.mainTableView.mj_header?.endRefreshing()
                self?.mainTableView.mj_footer = nil
                
            case .HJFooterRefresh_hasMoreData:
                self?.mainTableView.mj_header?.endRefreshing()
                self?.mainTableView.mj_footer?.resetNoMoreData()
                self?.mainTableView.mj_footer?.endRefreshing()
                
            case .HJFooterRefresh_hasNoMoreData:
                self?.mainTableView.mj_header?.endRefreshing()
                self?.mainTableView.mj_footer?.endRefreshingWithNoMoreData()
                
            case .HJRefreshError:
                self?.mainTableView.mj_footer?.endRefreshing()
                self?.mainTableView.mj_header?.endRefreshing()
                
            default:
                break
            }
            
            self?.mainTableView.reloadData()
            
        }).disposed(by: self.dispoaseBag)
    }
    
    
    
    
}

extension SHRxHomeView : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HJHomeTableViewCell.self), for: indexPath) as! HJHomeTableViewCell
        if viewModel.dataArray.count > indexPath.row {
            cell.viewModel = viewModel.dataArray[indexPath.row]
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellClickSubject.onNext(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
}

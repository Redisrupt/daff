// -*- mode:java; tab-width:4; c-basic-offset:4; indent-tabs-mode:nil -*-

class TableDiff {
    private var align : Alignment;

    public function new(align: Alignment) {
        this.align = align;
    }

    public function test() : Report { 
        var report : Report = new Report();
        var order : Ordering = align.toOrder();
        var units : Array<Unit> = order.getList();
        var has_parent : Bool = (align.reference != null);
        var a : Table;
        var b : Table;
        var p : Table;
        if (has_parent) {
            p = align.getSource();
            a = align.reference.getTarget();
            b = align.getTarget();
        } else {
            a = align.getSource();
            b = align.getTarget();
            p = a;
        }
        //if (a.width!=b.width || p.width!=b.width) {
        //trace("TableDiff currently expects constant columns");
        //return null;
        //}
        
        for (i in 0...units.length) {
            var unit : Unit = units[i];
            if (unit.p<0 && unit.l<0 && unit.r>=0) {
                report.changes.push(new Change("inserted row r:" + unit.r));
            }
            if ((unit.p>=0||!has_parent) && unit.l>=0 && unit.r<0) {
                report.changes.push(new Change("deleted row l:" + unit.l));
            }
            if (unit.l>=0&&unit.r>=0) {
                var mod : Bool = false;
                var av : View = a.getCellView();
                for (j in 0...a.width) {
                    // ...
                }
            }
        }
        // we don't look at any values yet
        return report;
    }
}

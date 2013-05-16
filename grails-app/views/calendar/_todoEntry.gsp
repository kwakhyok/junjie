<%
    def labels = [high:'label-important', medium:'label-warning', low:'label-success']
    def priorities = [high:'紧急', medium:'重要', low:'普通']
    %>
<li>
    ${plan.task?.title} <span class="time">${ plan.endDate.format('yyyy-MM-dd')}</span>
    <span class="label ${labels.get(plan.priority)}">${priorities.get(plan.priority)}</span>
    <span class="todo-actions">
        <a href="#"><i class="halflings-icon ok"></i></a>
        <a href="#" class="todo-remove"><i class="halflings-icon remove"></i></a>
    </span>
</li>
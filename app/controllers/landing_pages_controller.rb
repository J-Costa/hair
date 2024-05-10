class LandingPagesController < ApplicationController
  def index
    @stores = Store.all.order(:name)
    @services = Service.all.order(:name)
    @unit_frames = {
      "2": '<iframe class="h-48 w-96 ml-2" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1826.1484620599051!2d-46.69718646117861!3d-23.73678883936255!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce4f16c82a4b61%3A0xfc61ce3d5c552afa!2sSr.Prudente%20Barbearia!5e0!3m2!1spt-BR!2sbr!4v1715362726656!5m2!1spt-BR!2sbr" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
      "1": '<iframe class="h-48 w-96 ml-2" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1826.1434403141393!2d-46.69659236117856!3d-23.73714713936925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce4f8fd2d70017%3A0xc0f24efa8ed73df!2sBarbearia%20Sr.Prudente!5e0!3m2!1spt-BR!2sbr!4v1715362615365!5m2!1spt-BR!2sbr" width="400" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>'
    }
    if @current_customer
      @next_schedule = @current_customer.schedules.where('date >= ?', Date.today).order(:date).first
    end
  end
end

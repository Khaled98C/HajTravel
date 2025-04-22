final List<RehlaModel> rehlalist = [
  RehlaModel(
    title: 'الإحرام',
    description:
        'عليك عقد نية الدخول في عبادة الحج، والاشتغال بأعمالها قصداً مقرونا بالتلبية، كما أنه يجب عليك أن تتجرد من كل مظاهر اللباس والزينة وترتدي ملابس الإحرام',
    image: 'images/1a.png',
  ),
  RehlaModel(
    title: 'الطواف',
    description:
        '.عند دخول مكة قم بأداء طواف القدوم و ذلك بطواف الكعبة سبعة أشواط. ثم صلِّ ركعتي الطواف خلف مقام إبراهيم إن تيسر.',
    image: 'images/2a.png',
  ),
  RehlaModel(
    title: 'السعي بين الصفا والمروة',
    description:
        'قم بالسعي بين الصفا والمروة 7 أشواط مبتدئا بالصفا وخاتما بالمروة',
    image: 'images/3a.png',
  ),
  RehlaModel(
    title: 'منى (يوم التروية)',
    description:
        'توجه إلى منى فجر اليوم الثامن من ذي الحجة، وقم بالمبيت بها والإكثار من التلبية والصلاة فيها إلى فجر اليوم التاسع',
    image: 'images/4a.png',
  ),
  RehlaModel(
    title: 'عرفات (يوم الحج الأكبر)',
    description:
        'في التاسع من ذي الحجة، توجه إلى عرفات و قم بالإكثار من الدعاء والذكر إلى وقت غروب الشمس',
    image: 'images/5a.png',
  ),
  RehlaModel(
    title: 'مزدلفة',
    description:
        'بعد غروب شمس التاسع من ذي الحجة، توجه إلى مزدلفة وقم بالمبيت هناك وجمع سبع حصيات لرمي جمرة العقبة',
    image: 'images/6a.png',
  ),
  RehlaModel(
    title: 'رمي جمرة العقبة',
    description:
        'في العاشر من ذي الحجة (يوم العيد)، توجه إلى منى و قم برمي جمرة العقبة بسبع حصيات مع التكبير',
    image: 'images/7a.png',
  ),
  RehlaModel(
    title: 'الأضحية',
    description:
        ' بتقديم الأضحية للتقرب بها إلى الله. علما و أنه يتم مشاركة الأضحية مع المحتاجين',
    image: 'images/8a.png',
  ),
  RehlaModel(
    title: 'الحلق او التقصير',
    description: 'قم بحلق شعرك أو تقصيره. ثم انزع الإحرام وارتدِ ملابسك العادي',
    image: 'images/9a.png',
  ),
  RehlaModel(
    title: 'طواف الإفاضة',
    description:
        'عد إلى مكة وقم بأداء طواف الإفاضة و ذلك بطواف الكعبة سبعة أشواط، ثم صلِّ ركعتي الطواف خلف مقام إبراهيم إن تيسر',
    image: 'images/10a.png',
  ),
  RehlaModel(
    title: 'رمي الجمرات الثلاث',
    description:
        'عد إلى منى للمبيت بها ليالي التشريق والقيام برمي الجمرات الثلاث (جمرة العقبة - الجمرة الكبرى، والجمرة الوسطى، والجمرة الصغرى) يوم 11 ويوم 12 من شهر ذي الحجة، ولمن أراد التأخر يوم 13 من شهر ذي الحجة',
    image: 'images/11a.png',
  ),
   RehlaModel(
    title: 'طواف الوداع',
    description:'قبل مغادرتك مكة، قم بأداء طواف الوداع وذلك بطواف الكعبة سبعة أشواط'
     ,
    image: 'images/12a.png',
  ),
];

class RehlaModel {
  final String title;
  final String description;
  final String image;

  RehlaModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

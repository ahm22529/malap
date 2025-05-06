import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malab/component/custom_back_buttom.dart';
import 'package:malab/component/custom_button.dart';
import 'package:malab/component/custom_image_handler.dart';
import 'package:malab/component/text_builder.dart';
import 'package:malab/core/utiles/app_images.dart';
import 'package:malab/core/utiles/app_styel.dart';
import 'package:malab/fetures/meeting/prsention/manager/cubit/meeting_cubit.dart';
import 'package:malab/fetures/meeting/prsention/view/screen/Live_stream%20copy.dart';

class CreatMetting extends StatelessWidget {
  const CreatMetting({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MeetingCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CustomBackButtonWidget(),
          ),
          title: Text(
            "انشاء اجتماع جديد",
            style: AppStyles.f19700(context)
                .copyWith(fontSize: 22, color: Colors.black),
          ),
        ),
        body: BlocConsumer<MeetingCubit, MeetingState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomImageHandler(AppImages.videocall),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldBuilder(
                        controller:
                            context.read<MeetingCubit>().numberController,
                        title: "رقم العرفه"),
                    TextFieldBuilder(
                        controller: context.read<MeetingCubit>().nameController,
                        title: "اسم الاجتماع"),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                        text: "انشاء",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => LiveStrem(
                                        userName: context
                                            .read<MeetingCubit>()
                                            .nameController
                                            .text,
                                        id: context
                                            .read<MeetingCubit>()
                                            .numberController
                                            .text,
                                      )));
                        })
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
